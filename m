Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A740C852191
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 23:40:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oZgZ6XNN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYfYJ2KyZz3dX5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 09:40:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oZgZ6XNN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYfXW06Xxz2yl1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 09:39:38 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41CMcMwG010571;
	Mon, 12 Feb 2024 22:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=oZgZ6XNNUVvnCIFNP67f097yZq7DoLanppvJp6tygK+wdcoKnZa+Ms6GOivATeMdW2J3
 AFcGkwbRl9hftOLZNoE8zmTbyjDafEYJU/vS3yeUNZpIWo1cqZFtzF7Mr45BPolMuKnH
 LOFwSX1hSmBq+maXsw2WXSkpOmxI5P8ZDKprcbei/v7u79MciRHnFVcVEJzrEzuQsoh2
 1mpN6mTyKFrf084lR5ufrqVVEiSA05dd2eTlf31of0ww/xnpa2+oG1LaM8TzaxEYy/dM
 677zGAZRiesIHv4Sv8zl3VW2GzUS7DMHY+uUe8P5Xz8cAQCNRm7Sq1/EdiEJdNxoZFsn DA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w7v9r80j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 22:39:31 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41CLoREf024878;
	Mon, 12 Feb 2024 22:39:31 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6mfp3ksp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 22:39:31 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41CMdSdo10158718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Feb 2024 22:39:30 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBFB22004B;
	Mon, 12 Feb 2024 22:39:27 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8452A20040;
	Mon, 12 Feb 2024 22:39:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Feb 2024 22:39:27 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 84D7B60341;
	Tue, 13 Feb 2024 09:39:25 +1100 (AEDT)
Message-ID: <c287812dac3282feb88d7ef9fb14f88d0a1909ae.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kasan: Limit KASAN thread size increase to 32KB
From: Benjamin Gray <bgray@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 13 Feb 2024 09:39:25 +1100
In-Reply-To: <20240212064244.3924505-1-mpe@ellerman.id.au>
References: <20240212064244.3924505-1-mpe@ellerman.id.au>
Autocrypt: addr=bgray@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEYzuwexYJKwYBBAHaRw8BAQdAsgBYEqW6nNaL7i0B3z1RqyMl8ADupDef+5Sfe+JbzeC0I0JlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+iJMEExYKADsWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRB5xrdpFsvehCiCAP4g7CDkmsakpwv9QxU2D8dophyCIS8meDOQX4/83/sjHgEA5HWbUsbRCpVmeIgu0iNwhw3cmqhkv7ZkBGe3HhHaXg65Ay4EYzuwkREIAJjQ1EDAmLbOENucLy7VUzyNNCHkBirK/+FbjwOW7VIphc8zgsbZ26ZjIu5vC1NY7U7DpOvLAfR0g4+2QeKiQ8EEcuxLhif5X+jsekq0oSTVLcyNYXArJ3mhmV7jRhz8wBueMoXY/k+P3HCVLi4vzroJzN06Hrnmeu5ELlC4MbuvGRTvW751Y/o7gTa6hyyLb2P4pQ+sj/PuIn2Ly1RJPF839HVcOOERkjZ2QZNJnXEhlpfDD7LyRsy9Xm6MxGKRE5VsfjaO+Q8B6ByhXIy5/QK41AF1uSIPBfkZ8+AsBFw8Z87VGQ61tDdzi0U77IdYr98KsgRJ30vHInfKKdSj4csBALzNKjOFmp7dS8mefp3viouy4vWPla8+XZU6ZrRNtD8hB/9FsE7KVTdIBp4xqf6oN1ieTD7PNsQsBQWdDA/rg2bP7IJQkf4Pvn0yoATOFgqhQwadkwT7fwWAfk0YPEE+DPom1V3JwNM6wPaEJeNaMjleqTfAfauLaB9Sc+zJvN5cORrEjSL/0jfJBBdjW5j5BmdUDM1mGuBNVQhGlWHc/Rf7qokMoZAfYiPi/z44rB9zvNfb8t6sVNqHbC2fKRBn/0k8cZ9+qBEIj6vbkqUuih8xNDA+TU+FxPqJxyahqFv+LL9cfZelC0v3D
	mjW5LaBPOdGiiDE1w95Ri9HRK27S2dRZpyib9L4mkfYWPAF41mTudjKmVpgtBLO//rO+zmF04OMB/4sWJhLfvhq1CXULDqw5dcuIAIYwf2ughOtyAPFK1ViDcMO5X1bVpNAFO5m4VBpZvFDQ0j0JfqfVBdL68uH05W1/8dMj76RaWj5m0rLM5slY1FQUPddSU+ic9vaZhlDepjU3ZyI8fmioofNGHaxJq6uNTytKdj87kwDV6PQ4hmuGtY56C7JCgjp053sRJ6sXqgKBWfe4ZOJH17mQm+fws93byLoZvvz4Z3im0Rb0MlFo/WirNyhu+TmTNLpnzFUZfenoKrqAkZLY8u1iCFquhgqA321P+sfYew66DtwQmaoi2GKmF89y2enXXzjLNKfLDKkuVoKxFSPeizYqrLi22R9iO8EGBYKACAWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwkQIbAgCBCRB5xrdpFsvehHYgBBkRCAAdFiEESFUlaLYscsf4Dt5gaavCcpI6D/8FAmM7sJEACgkQaavCcpI6D/95UgEAqfSj0QhCrYfazQiLDKJstrz3oIKFjhB6+FYMZqt+K1MA/2ioFtHbypeeWbsqYYRhRyTjAKcvE1NZGtH/YWLgkViUidoBAN6gFX/P+VWB77/w8S/BnPmnJx45wmphlkCL8ckOyopFAQCj9eWamHCl2DSaASMSuoZed6C6Gm0OFtuZh/r8K485BQ==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _AQ6K_e-3V4u1GzcqPt5eBnrpFabv6j7
X-Proofpoint-GUID: _AQ6K_e-3V4u1GzcqPt5eBnrpFabv6j7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_18,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=489 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402120176
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: spoorthy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



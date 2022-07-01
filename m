Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB8A5632D9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 13:47:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZD2Y5tf5z3dtd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 21:47:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A4IB57ov;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A4IB57ov;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZD1r5r3wz3blB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 21:46:40 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261Bi5Qw018815;
	Fri, 1 Jul 2022 11:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=GJ5SVeiURWClwUzMi7+kGbBC8gwCUvlJqL9o2GLxGEs=;
 b=A4IB57ov8gfXbsWxDoUCsBUorY+Xi5buZZZRmaU/cULXgnA/fbgqbcFhVWkJI1qQdQi3
 ysyIFPPBkskAyKeP7qrHB9xqGDleJFzf70mmvVVwWlPvR2Qb91V8QlWrOOQz2BfbBvpC
 Pcl9Va6o81zNjvpY/0ShYqazr6MSqIx4Wti4d0iKtDV7k6wkTTVSQTEf6/Qhg9LuzjH2
 p2hUxn1zyLOxjfg9Y273K3zlCahcrUjcadhsDHgAq6Mo9CEdOz4xsspqYYxbq2Hv9++3
 pR+mENpQgh+MnWbent3OQPaWZMTOyzuk90vZNIcHTAozig5shSU1+mwNapEmVBMcSHRd rA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h20a702cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 11:46:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261BLKjE007721;
	Fri, 1 Jul 2022 11:46:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3gwt091mah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 11:46:34 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 261BkWDL13959470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Jul 2022 11:46:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19E985204F;
	Fri,  1 Jul 2022 11:46:32 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.63.157])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0BEA15204E;
	Fri,  1 Jul 2022 11:46:30 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: WARN at crypto/testmgr.c:5774 (next)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <CALrw=nF6EBFQCc8bn9A_Q0nz2O3TSJKsj=ErZUH37-EzLy-qmQ@mail.gmail.com>
Date: Fri, 1 Jul 2022 17:16:29 +0530
Message-Id: <383B6D2F-6F95-4A2D-9992-0A55AD058963@linux.ibm.com>
References: <74179C93-0D19-4A8A-81EB-07BD836A3BD3@linux.ibm.com>
 <CALrw=nF6EBFQCc8bn9A_Q0nz2O3TSJKsj=ErZUH37-EzLy-qmQ@mail.gmail.com>
To: Ignat Korchagin <ignat@cloudflare.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sGZl_CBlQOJ25NeTq6H_L84jGUqN0uxH
X-Proofpoint-ORIG-GUID: sGZl_CBlQOJ25NeTq6H_L84jGUqN0uxH
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_06,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010043
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-crypto <linux-crypto@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> Thanks for the report. I've already submitted a follow up patch:
> https://patchwork.kernel.org/project/linux-crypto/patch/20220630140506.90=
4-1-ignat@cloudflare.com/

Thanks, the fix resolves the issue for me.

- Sachin


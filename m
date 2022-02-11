Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 089B74B24A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 12:45:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwBcg4gLzz3c7f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 22:45:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YsphtSzT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YsphtSzT; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwBbz40H1z2xDD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 22:44:30 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21B8UOh6025927; 
 Fri, 11 Feb 2022 11:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=ePIyHCGwB3p8G2qD/O5/VZiBUO5jydYuzuzJGELgpIs=;
 b=YsphtSzT2tvVTjicRhxfbPNyIzciHZn9oHfZej4SmCbVHd1xXh0Z8XP+EgWK1QZfJnXR
 koEFaVSvUxr9B6v0ltKoSujxhOWG7SvF5VHU1l1yqfp00I3DaRXFIwBKFRVM2VlNwcA8
 wfeicAT8/2+iDagWcxn6uUsFT4uwcUKbg0WwQVUUKUG7LofWhV4e+LiNlW6s0ENt3EjY
 rACcANmKYM/lR/uKU3kbdDljIKwUSFXqIWbbExrw7yMsuCB0agLHMBS01UKZ0XHB9ib5
 kb7ruq92oq4OH6IdkPlOzUmX+hBWxeZrVOXDXbKdZRDQ8ZEuQDg468TKT0hBwoSSj9x2 dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5gbvqpvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 11:44:19 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21BBdNNO005302;
 Fri, 11 Feb 2022 11:44:19 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5gbvqpv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 11:44:18 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21BBgOXu020482;
 Fri, 11 Feb 2022 11:44:17 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3e1gva6x91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 11:44:17 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21BBiDiQ45744468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 11:44:13 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CB8AAE056;
 Fri, 11 Feb 2022 11:44:13 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E40DBAE045;
 Fri, 11 Feb 2022 11:44:12 +0000 (GMT)
Received: from localhost (unknown [9.43.26.72])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Feb 2022 11:44:12 +0000 (GMT)
Date: Fri, 11 Feb 2022 17:14:11 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH kernel 2/3] powerpc/llvm: Sample config for LLVM LTO
To: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev
References: <20220211023125.1790960-1-aik@ozlabs.ru>
 <20220211023125.1790960-3-aik@ozlabs.ru>
In-Reply-To: <20220211023125.1790960-3-aik@ozlabs.ru>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1644579444.bal9kji6uc.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rbnPX762MV5KMj-wy5NaZvzqfgpb8jab
X-Proofpoint-GUID: FFnGLbCgnwD_EF_xmcZbj_LXeg53GOcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_04,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110066
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy wrote:
>=20
> Disables CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT as CONFIG_HAS_LTO_CLANG
> depends on it being disabled. In order to avoid disabling way too many
> options (like DYNAMIC_FTRACE/FUNCTION_TRACER), this converts
> FTRACE_MCOUNT_USE_RECORDMCOUNT from def_bool to bool.

<snip>

> +CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT=3Dn

I don't think that will work since we have no other ways of generating=20
mcount locations on powerpc. And since we decided to only support=20
DYNAMIC_FTRACE, I guess we will need to disable FUNCTION_TRACER to get=20
this working, for now.

I am looking into ways to get ftrace working in this scenario.


- Naveen

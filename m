Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 522844ADD79
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 16:50:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtSBx0fmgz3bVB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 02:50:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Euieky52;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Euieky52; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtS9B4Mfcz3bTs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 02:48:46 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 218Ew732024582; 
 Tue, 8 Feb 2022 15:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=TTmypR2+Qmd5UuwVkWZmHNSE6x5U/8FmfgzCEbTDqMo=;
 b=Euieky52nTcCHKHGMZP+59xvAZ6I1gG6qtYYyu1dydvgJCqOaYOf0KquObr4oD+VAUgK
 7VbtQ8K7GTmrycuHDvs8CG7UparNpkI7plFOFXGjYLcZGxIozM9YJgXgynt4QMaO84oV
 e2di6Qmzbhoj/uOXh/P48XYgCMcQNfD69bmm56V4IYb1LxWSeUVG4ejxhYZ+oRuB9wAa
 ieBflaVrPZ4dA5wQZbXyZsHTxD313ZdMQ14ZpXyWgff2mLyACLQxhISHx4B5xPjFW+w9
 63gX8JxkNQVUNJ1/h0k49a+j13JyGnQ8p1E5e2v3vfaOYyaNZBvdZdC/arDQNy9WTaaY Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3npsha2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 15:48:41 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 218FKtUh017714;
 Tue, 8 Feb 2022 15:48:40 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3npsha1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 15:48:40 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 218FmSKg017072;
 Tue, 8 Feb 2022 15:48:39 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3e1gvauqrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 15:48:39 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 218Fmabe8454800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Feb 2022 15:48:36 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FCCAAC05F;
 Tue,  8 Feb 2022 15:48:36 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5B20AC059;
 Tue,  8 Feb 2022 15:48:35 +0000 (GMT)
Received: from localhost (unknown [9.211.103.251])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Feb 2022 15:48:35 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Subject: Re: [PATCH v2 1/4] powerpc/pseries/vas: Define global hv_cop_caps
 struct
In-Reply-To: <9ffeb5567b2836ee8326d530310e4eb4f6f9f1f2.camel@linux.ibm.com>
References: <d977832373068e57a13c0e2e47afb2dd4e8d7c3d.camel@linux.ibm.com>
 <9ffeb5567b2836ee8326d530310e4eb4f6f9f1f2.camel@linux.ibm.com>
Date: Tue, 08 Feb 2022 09:48:34 -0600
Message-ID: <87iltps6jx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rwwLRIH4uvU8w6YrChhuwltE9ZPaYZIp
X-Proofpoint-GUID: _OEH-isT0_FPZd0-lNor7Ro2xwdYFwza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080096
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> The coprocessor capabilities struct is used to get default and
> QoS capabilities from the hypervisor during init, DLPAR event and
> migration. So instead of allocating this struct for each event,
> define global struct and reuse it, especially eliminate memory
> allocation failure during migration.

Which allows the migration code to avoid adding an error path. I could
go either way, but this approach seems fine to me assuming all users of
the global object are guarded by an appropriate lock.

Acked-by: Nathan Lynch <nathanl@linux.ibm.com>


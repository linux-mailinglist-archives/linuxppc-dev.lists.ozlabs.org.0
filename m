Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77418487B25
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 18:14:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVqZz3LZFz3bZC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 04:14:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bo0OJis4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bo0OJis4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVqZ81fXxz30MT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 04:13:51 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207GD5qY011413; 
 Fri, 7 Jan 2022 17:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=jl82BzuHxu+nRlvTWTgtr45rI0Qt9HJBDaLp/FXxyZQ=;
 b=bo0OJis4uJaq6pN3FeD5tfLhrCtYCepNawd4D9JZbL8oLgHiGq8lv5QG5HfnXqZWfMJP
 +21cug74/qzB3pcdUV3EH+JCf6u3d4eg6+Z8CMf3B3JwizlVGycH/qM2d+ooy7Skb3IW
 i7pIKMZl9WPX9y4i6h2zXn3aATw8RU8HdbZBEg/OTaqv251rk246PcMZNEWBOQ4CdSTb
 ZFt7Uq+FfcKzVdrZD2/3uK8Eb2ZjqLlU1d14dsGl8UMzSjQwAFX3oBVMwO0QJhGzfq3G
 6dK6lGoCSPDQcXhDzzhk/Mi+4yi0SfsLdSatYk2jmC6XbiCVB5lA9RRh1TpjNrx9VqnP 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wxnsa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 17:13:40 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207GG1jG003681;
 Fri, 7 Jan 2022 17:13:40 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wxns8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 17:13:39 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207GvlZ4008071;
 Fri, 7 Jan 2022 17:13:37 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3de5m0ydg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 17:13:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207HDZBa43122956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 17:13:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1992BA405E;
 Fri,  7 Jan 2022 17:13:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75131A4057;
 Fri,  7 Jan 2022 17:13:34 +0000 (GMT)
Received: from localhost (unknown [9.43.90.227])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 17:13:34 +0000 (GMT)
Date: Fri, 07 Jan 2022 22:43:32 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc64/bpf: Store temp registers' bpf to ppc
 mapping
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210727065539.299598-1-jniethe5@gmail.com>
In-Reply-To: <20210727065539.299598-1-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1641575253.jrrvpz4a4n.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KGYQpoMeeFglFmn_wbCNg06qwqdg2exz
X-Proofpoint-GUID: iRKhQ6hoUPtzfBU_933I_6CXjGdcNT3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_07,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=979 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070113
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

Jordan Niethe wrote:
> In bpf_jit_build_body(), the mapping of TMP_REG_1 and TMP_REG_2's bpf
> register to ppc register is evalulated at every use despite not
> changing. Instead, determine the ppc register once and store the result.
> This will be more useful when a later patch introduces a more complex
> mapping from bpf registers to ppc registers.
>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/net/bpf_jit_comp64.c | 163 +++++++++++++-----------------
>  1 file changed, 69 insertions(+), 94 deletions(-)

I know this is eons ago and this patch will need updating, but if you=20
intend to revive this:
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


Thanks,
Naveen


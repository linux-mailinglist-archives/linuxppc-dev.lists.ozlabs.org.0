Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 226BC423212
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 22:32:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP8Q90SpBz30Bm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 07:32:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BCEZdNnj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BCEZdNnj; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP8J533Rjz2yxv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 07:26:45 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195JaMSj008527; 
 Tue, 5 Oct 2021 16:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kplCmVJPBNtiZEGwwh71wHlt+GclXYm96k5TjH79J54=;
 b=BCEZdNnjfbSc8RLjxExr1xtcX2AMgd3tabyUe0i+w6v2aYJSng1npiTAJv/tZKXj0jiQ
 DvKWzt45x2TcmNqIM95AqgU2AuDwdM0uvYAd1IGcOj7DPmx36oY3TDFGTooKrbZIgBwW
 OtFciTe45JCAPgiZCmA0jCKI83FUJMO2b/RXFWahkAr5GJBvA5+G1auQQFYvEW1p13gf
 dN2XjCzzuvgrCWeopub7siB70v6VLho39DHsJUKYxfi/55fY2jUW3r5esZZzFheABXbz
 QLI0OwY8ZX3dFE8O6BfNWKy+Aus+TDdP0t86wTjD0329sWqin6yF68DN2nqqChihn0MA aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgvgpstuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 16:26:27 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 195JhUDM009563;
 Tue, 5 Oct 2021 16:26:26 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgvgpstue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 16:26:26 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 195KHDIR022148;
 Tue, 5 Oct 2021 20:26:25 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3bef2a61h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 20:26:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 195KL2r952232460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 20:21:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49ECFAE04D;
 Tue,  5 Oct 2021 20:26:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA81DAE051;
 Tue,  5 Oct 2021 20:26:18 +0000 (GMT)
Received: from naverao1-tp.ibm.com (unknown [9.43.5.112])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Oct 2021 20:26:18 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Jordan Niethe <jniethe5@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Song Liu <songliubraving@fb.com>
Subject: [PATCH v2 07/10] powerpc/bpf ppc32: Fix ALU32 BPF_ARSH operation
Date: Wed,  6 Oct 2021 01:55:26 +0530
Message-Id: <6d24c1f9e79b6f61f5135eaf2ea1e8bcd4dac87b.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 94slfGO7h7pzZQhnOJLS-cSUtgfmeEaw
X-Proofpoint-GUID: Q-tjRdWMFFuhPujVa3T90dxlKXHOYi0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-05_04,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050117
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Correct the destination register used for ALU32 BPF_ARSH operation.

Fixes: 51c66ad849a703 ("powerpc/bpf: Implement extended BPF on PPC32")
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index a74d52204f8da2..519ecb9ab67266 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -625,7 +625,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			EMIT(PPC_RAW_LI(dst_reg_h, 0));
 			break;
 		case BPF_ALU | BPF_ARSH | BPF_X: /* (s32) dst >>= src */
-			EMIT(PPC_RAW_SRAW(dst_reg_h, dst_reg, src_reg));
+			EMIT(PPC_RAW_SRAW(dst_reg, dst_reg, src_reg));
 			break;
 		case BPF_ALU64 | BPF_ARSH | BPF_X: /* (s64) dst >>= src */
 			bpf_set_seen_register(ctx, tmp_reg);
-- 
2.33.0


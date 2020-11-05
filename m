Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D902A76DC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 06:23:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRX4N3cZFzDr0p
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:23:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.69;
 helo=se14-2.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se14-2.privateemail.com (se14-2.privateemail.com
 [198.54.127.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRWrb5ztnzDqhb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 16:13:35 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se14.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>) id 1kaXaS-0008uv-UQ
 for linuxppc-dev@lists.ozlabs.org; Wed, 04 Nov 2020 21:13:32 -0800
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id C03C1A72
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:27 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id ADAFF80046
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 00:13:27 -0500 (EST)
Received: from geist.attlocal.net (unknown [10.20.151.249])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 798F880041
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:27 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/8] powerpc/uaccess: Add unsafe_copy_from_user
Date: Wed,  4 Nov 2020 23:16:54 -0600
Message-Id: <20201105051701.25053-2-cmr@codefail.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201105051701.25053-1-cmr@codefail.de>
References: <20201105051701.25053-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00244926952032)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0XvADx2zSFwG+3csxFBPBHmpSDasLI4SayDByyq9LIhVXzHpYKxDwMt+
 +zmW/nipx0TNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX7G2/5kFLVleZZ6jnwzbv1uFO05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgix6Fhd62KY0TvtygpLSFJ3Lw5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipUHvm3Pq/TMVhLiLVSlbDnIEsVH1HkXSWW+lJituJnqw31/E3ahF5MMcDI7KdpjQ
 KUg2DwcIutxTdYYuCv7MB8w4iSij0rwbBa82X4V+KdE8ybxQmwA+8NxVIq0MJiSKg9jlDHh8k6TT
 dHl8m1/8O/92QjNLubgZSlcJjVjePeKVE0yhWxRviTEhnM4stux5zs2eyc346LIB3Zm3bJBgM0nW
 nv2O+GUciRvT7igjbfErFtEQiNpWr8Dshv6DftvtlGZJgVZw2KizLfHKT1Ui9eqnil7sNNnzdI7c
 WFzHzXcM92PNDpgLsd6Ddd/s7VM53ngEDB0hGM25vwdLItd8JHlwRg+9bWPA7CG7LJO22QfGpvIQ
 LT5rkrG+KrR4dVWHxijLx/yB4/0tOjisrLyLrqZc9aUV1oY4fX3W5eOCNA39ksRRE30nnfZObe7o
 1mbr5b4m4O41f3i6XB3J2CA/ZpSpytsBXZZv0niRRFlqwL4JNTd9Km+1fuQNFP4CpCvZPbNBqyph
 zXy+6cTE/AxalG8BEiCj5vZGv9mneHqn4w6ZRYMJqVDlz3D3q3rGz4wpqbrr3vieQzASqOF9IoeU
 DZANWzkl2RGDx1/F1uE2HybNOt0p+xrrv5paups8mshKvA==
X-Report-Abuse-To: spam@se5.registrar-servers.com
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

Implement raw_copy_from_user_allowed() which assumes that userspace read
access is open. Use this new function to implement raw_copy_from_user().
Finally, wrap the new function to follow the usual "unsafe_" convention
of taking a label argument. The new raw_copy_from_user_allowed() calls
__copy_tofrom_user() internally, but this is still safe to call in user
access blocks formed with user_*_access_begin()/user_*_access_end()
since asm functions are not instrumented for tracing.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/include/asm/uaccess.h | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index ef5bbb705c08..96b4abab4f5a 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -403,38 +403,45 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
 }
 #endif /* __powerpc64__ */
 
-static inline unsigned long raw_copy_from_user(void *to,
-		const void __user *from, unsigned long n)
+static inline unsigned long
+raw_copy_from_user_allowed(void *to, const void __user *from, unsigned long n)
 {
-	unsigned long ret;
 	if (__builtin_constant_p(n) && (n <= 8)) {
-		ret = 1;
+		unsigned long ret = 1;
 
 		switch (n) {
 		case 1:
 			barrier_nospec();
-			__get_user_size(*(u8 *)to, from, 1, ret);
+			__get_user_size_allowed(*(u8 *)to, from, 1, ret);
 			break;
 		case 2:
 			barrier_nospec();
-			__get_user_size(*(u16 *)to, from, 2, ret);
+			__get_user_size_allowed(*(u16 *)to, from, 2, ret);
 			break;
 		case 4:
 			barrier_nospec();
-			__get_user_size(*(u32 *)to, from, 4, ret);
+			__get_user_size_allowed(*(u32 *)to, from, 4, ret);
 			break;
 		case 8:
 			barrier_nospec();
-			__get_user_size(*(u64 *)to, from, 8, ret);
+			__get_user_size_allowed(*(u64 *)to, from, 8, ret);
 			break;
 		}
 		if (ret == 0)
 			return 0;
 	}
 
+	return __copy_tofrom_user((__force void __user *)to, from, n);
+}
+
+static inline unsigned long
+raw_copy_from_user(void *to, const void __user *from, unsigned long n)
+{
+	unsigned long ret;
+
 	barrier_nospec();
 	allow_read_from_user(from, n);
-	ret = __copy_tofrom_user((__force void __user *)to, from, n);
+	ret = raw_copy_from_user_allowed(to, from, n);
 	prevent_read_from_user(from, n);
 	return ret;
 }
@@ -542,6 +549,9 @@ user_write_access_begin(const void __user *ptr, size_t len)
 #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
 #define unsafe_put_user(x, p, e) __put_user_goto(x, p, e)
 
+#define unsafe_copy_from_user(d, s, l, e) \
+	unsafe_op_wrap(raw_copy_from_user_allowed(d, s, l), e)
+
 #define unsafe_copy_to_user(d, s, l, e) \
 do {									\
 	u8 __user *_dst = (u8 __user *)(d);				\
-- 
2.29.0


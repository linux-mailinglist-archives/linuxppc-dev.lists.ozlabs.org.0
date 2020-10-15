Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7B428F636
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 17:52:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBv1f2bl4zDqYY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 02:52:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.72;
 helo=se15-1.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se15-1.privateemail.com (se15-1.privateemail.com
 [198.54.127.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBv023YSyzDqRL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 02:51:14 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se15.registrar-servers.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <cmr@codefail.de>) id 1kT4iT-0002Hy-NV
 for linuxppc-dev@lists.ozlabs.org; Thu, 15 Oct 2020 07:58:58 -0700
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id E62D0A70
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:52 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id D2CDD8004A
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 10:58:52 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.235])
 by mta-11.privateemail.com (Postfix) with ESMTPA id A459880041
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:52 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/8] powerpc/uaccess: Add unsafe_copy_from_user
Date: Thu, 15 Oct 2020 10:01:52 -0500
Message-Id: <20201015150159.28933-2-cmr@codefail.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015150159.28933-1-cmr@codefail.de>
References: <20201015150159.28933-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00193233972791)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0Z1apovzGPsYhEeBL1aoZmqpSDasLI4SayDByyq9LIhVt0I3FMaRZXlF
 zWBMq97wYUTNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX7zDNnDZzaQlmD5sMjPNVJAFO05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgi83+PBTijYijPG8NZSI4ZQ7w5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipUHvm3Pq/TMVhLiLVSlbDnIEsVH1HkXSWW+lJituJnqw31/E3ahF5MMcDI7KdpjQ
 KUg2DwcIutxTdYYuCv7MB8w4iSij0rwbBa82X4V+KdE8ybxQmwA+8NxVIq0MJiSKg9jlDHh8k6TT
 dHl8m1/8O/92QjNLubgZSlcJjVjePeKVE0yhWxRviTEhnM4stux5zhImD2XryHHXvPaqNrPREOWT
 G1bmlWkaJteaOAtonp0amgJEec4u8FTknEDiI6RmG2ZJgVZw2KizLfHKT1Ui9eqnil7sNNnzdI7c
 WFzHzXcM92PNDpgLsd6Ddd/s7VM53ngEDB0hGM25vwdLItd8JHlwRg+9bWPA7CG7LJO22QfG5uwj
 3VKIhMn3+9f/r55/JTcFkBYR8V3+0JM6whdTjXhc9aUV1oY4fX3W5eOCNA39ksRRE30nnfZObe7o
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
index 26781b044932..66940b4eb692 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -418,38 +418,45 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
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
@@ -571,6 +578,9 @@ user_write_access_begin(const void __user *ptr, size_t len)
 #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
 #define unsafe_put_user(x, p, e) __put_user_goto(x, p, e)
 
+#define unsafe_copy_from_user(d, s, l, e) \
+	unsafe_op_wrap(raw_copy_from_user_allowed(d, s, l), e)
+
 #define unsafe_copy_to_user(d, s, l, e) \
 do {									\
 	u8 __user *_dst = (u8 __user *)(d);				\
-- 
2.28.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 500861AE773
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 23:17:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493pp92NQkzDrgS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 07:17:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.233;
 helo=out03.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=xmission.com
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493phs2KfBzDrQx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 07:13:01 +1000 (AEST)
Received: from in01.mta.xmission.com ([166.70.13.51])
 by out03.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
 (envelope-from <ebiederm@xmission.com>)
 id 1jPYIE-00064z-Sv; Fri, 17 Apr 2020 15:12:58 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in01.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1jPYID-0007o4-Fc; Fri, 17 Apr 2020 15:12:58 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Christoph Hellwig <hch@lst.de>
References: <20200414070142.288696-1-hch@lst.de>
 <20200414070142.288696-3-hch@lst.de>
 <87pnc5akhk.fsf@x220.int.ebiederm.org>
Date: Fri, 17 Apr 2020 16:09:56 -0500
In-Reply-To: <87pnc5akhk.fsf@x220.int.ebiederm.org> (Eric W. Biederman's
 message of "Fri, 17 Apr 2020 16:08:23 -0500")
Message-ID: <87eeslakez.fsf_-_@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1jPYID-0007o4-Fc; ; ;
 mid=<87eeslakez.fsf_-_@x220.int.ebiederm.org>; ; ; hst=in01.mta.xmission.com; ;
 ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+se8KiNrzXF7RzWVDO08sNWSsUt9u0V5I=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa08.xmission.com
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,TR_Symld_Words,T_TooManySym_01,T_TooManySym_02,
 XMNoVowels,XMSubLong autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4301] *  0.7 XMSubLong Long Subject
 *  1.5 TR_Symld_Words too many words that have symbols inside
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa08 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
X-Spam-DCC: XMission; sa08 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;Christoph Hellwig <hch@lst.de>
X-Spam-Relay-Country: 
X-Spam-Timing: total 489 ms - load_scoreonly_sql: 0.05 (0.0%),
 signal_user_changed: 14 (2.9%), b_tie_ro: 12 (2.5%), parse: 1.15
 (0.2%), extract_message_metadata: 12 (2.5%), get_uri_detail_list: 1.69
 (0.3%), tests_pri_-1000: 12 (2.5%), tests_pri_-950: 1.40 (0.3%),
 tests_pri_-900: 1.14 (0.2%), tests_pri_-90: 239 (48.9%), check_bayes:
 237 (48.4%), b_tokenize: 6 (1.2%), b_tok_get_all: 166 (33.9%),
 b_comp_prob: 3.5 (0.7%), b_tok_touch_all: 56 (11.5%), b_finish: 1.37
 (0.3%), tests_pri_0: 195 (39.9%), check_dkim_signature: 0.51 (0.1%),
 check_dkim_adsp: 2.7 (0.6%), poll_dns_idle: 1.02 (0.2%), tests_pri_10:
 2.1 (0.4%), tests_pri_500: 7 (1.4%), rewrite_mail: 0.00 (0.0%)
Subject: [PATCH 2/2] signal: Remove the set_fs in
 binfmt_elf.c:fill_siginfo_note
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
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
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, linux-kernel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The code in binfmt_elf.c is differnt from the rest of the code that
processes siginfo, as it sends siginfo from a kernel buffer to a file
rather than from kernel memory to userspace buffers.  To remove it's
use of set_fs the code needs some different siginfo helpers.

Add the helper copy_siginfo_to_external to copy from the kernel's
internal siginfo layout to a buffer in the siginfo layout that
userspace expects.

Modify fill_siginfo_note to use copy_siginfo_to_external instead of
set_fs and copy_siginfo_to_user.

Update compat_binfmt_elf.c to use the previously added
copy_siginfo_to_external32 to handle the compat case.

Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---
 fs/binfmt_elf.c        | 5 +----
 fs/compat_binfmt_elf.c | 2 +-
 include/linux/signal.h | 7 +++++++
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 13f25e241ac4..a1f57e20c3cf 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1556,10 +1556,7 @@ static void fill_auxv_note(struct memelfnote *note, struct mm_struct *mm)
 static void fill_siginfo_note(struct memelfnote *note, user_siginfo_t *csigdata,
 		const kernel_siginfo_t *siginfo)
 {
-	mm_segment_t old_fs = get_fs();
-	set_fs(KERNEL_DS);
-	copy_siginfo_to_user((user_siginfo_t __user *) csigdata, siginfo);
-	set_fs(old_fs);
+	copy_siginfo_to_external(csigdata, siginfo);
 	fill_note(note, "CORE", NT_SIGINFO, sizeof(*csigdata), csigdata);
 }
 
diff --git a/fs/compat_binfmt_elf.c b/fs/compat_binfmt_elf.c
index aaad4ca1217e..fa0e24e1b726 100644
--- a/fs/compat_binfmt_elf.c
+++ b/fs/compat_binfmt_elf.c
@@ -39,7 +39,7 @@
  */
 #define user_long_t		compat_long_t
 #define user_siginfo_t		compat_siginfo_t
-#define copy_siginfo_to_user	copy_siginfo_to_user32
+#define copy_siginfo_to_external	copy_siginfo_to_external32
 
 /*
  * The machine-dependent core note format types are defined in elfcore-compat.h,
diff --git a/include/linux/signal.h b/include/linux/signal.h
index 05bacd2ab135..c1796321cadb 100644
--- a/include/linux/signal.h
+++ b/include/linux/signal.h
@@ -24,6 +24,13 @@ static inline void clear_siginfo(kernel_siginfo_t *info)
 
 #define SI_EXPANSION_SIZE (sizeof(struct siginfo) - sizeof(struct kernel_siginfo))
 
+static inline void copy_siginfo_to_external(siginfo_t *to,
+					    const kernel_siginfo_t *from)
+{
+	memcpy(to, from, sizeof(*from));
+	memset(((char *)to) + sizeof(struct kernel_siginfo), 0, SI_EXPANSION_SIZE);
+}
+
 int copy_siginfo_to_user(siginfo_t __user *to, const kernel_siginfo_t *from);
 int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from);
 
-- 
2.25.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8F4098DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 18:22:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7Ww90NlQz301N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 02:22:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.233;
 helo=out03.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7Wvj5x2lz2xg3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 02:21:53 +1000 (AEST)
Received: from in02.mta.xmission.com ([166.70.13.52]:36934)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mPoiL-003rDB-KW; Mon, 13 Sep 2021 10:21:49 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:47520
 helo=email.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mPoiJ-00GFz6-JY; Mon, 13 Sep 2021 10:21:48 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <1718f38859d5366f82d5bef531f255cedf537b5d.1631537060.git.christophe.leroy@csgroup.eu>
 <2b179deba4fd4ec0868cdc48a0230dfa3aa5a22f.1631537060.git.christophe.leroy@csgroup.eu>
 <87h7eopixa.fsf@disp2133>
Date: Mon, 13 Sep 2021 11:21:41 -0500
In-Reply-To: <87h7eopixa.fsf@disp2133> (Eric W. Biederman's message of "Mon,
 13 Sep 2021 10:57:37 -0500")
Message-ID: <87y280o38q.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1mPoiJ-00GFz6-JY; ; ; mid=<87y280o38q.fsf@disp2133>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX19YOxK9unwbVjxKnnW7IzmHNswDYE8PXPw=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa02.xmission.com
X-Spam-Level: ****
X-Spam-Status: No, score=4.2 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 T_TooManySym_02,T_TooManySym_03,XMGappySubj_01,XMGappySubj_02,
 XMSubLong,XM_B_SpammyTLD,XM_B_SpammyWords,XM_Body_Dirty_Words
 autolearn=disabled version=3.4.2
X-Spam-Virus: No
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000] *  0.7 XMSubLong Long Subject
 *  0.5 XMGappySubj_01 Very gappy subject
 *  1.0 XMGappySubj_02 Gappier still
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa02 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  0.2 XM_B_SpammyWords One or more commonly used spammy words
 *  1.0 XM_Body_Dirty_Words Contains a dirty word
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 *  1.0 XM_B_SpammyTLD Contains uncommon/spammy TLD
X-Spam-DCC: XMission; sa02 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ****;Christophe Leroy <christophe.leroy@csgroup.eu>
X-Spam-Relay-Country: 
X-Spam-Timing: total 585 ms - load_scoreonly_sql: 0.03 (0.0%),
 signal_user_changed: 3.6 (0.6%), b_tie_ro: 2.5 (0.4%), parse: 0.71
 (0.1%), extract_message_metadata: 11 (1.9%), get_uri_detail_list: 1.35
 (0.2%), tests_pri_-1000: 17 (2.9%), tests_pri_-950: 1.14 (0.2%),
 tests_pri_-900: 0.82 (0.1%), tests_pri_-90: 256 (43.8%), check_bayes:
 254 (43.4%), b_tokenize: 6 (1.0%), b_tok_get_all: 7 (1.2%),
 b_comp_prob: 1.52 (0.3%), b_tok_touch_all: 236 (40.3%), b_finish: 0.95
 (0.2%), tests_pri_0: 281 (48.0%), check_dkim_signature: 0.64 (0.1%),
 check_dkim_adsp: 3.1 (0.5%), poll_dns_idle: 1.20 (0.2%), tests_pri_10:
 2.7 (0.5%), tests_pri_500: 8 (1.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH RESEND v3 6/6] powerpc/signal: Use
 unsafe_copy_siginfo_to_user()
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
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
Cc: linux-kernel@vger.kernel.org, hch@infradead.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ebiederm@xmission.com (Eric W. Biederman) writes:

> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>
>> Use unsafe_copy_siginfo_to_user() in order to do the copy
>> within the user access block.
>>
>> On an mpc 8321 (book3s/32) the improvment is about 5% on a process
>> sending a signal to itself.

If you can't make function calls from an unsafe macro there is another
way to handle this that doesn't require everything to be inline.

From a safety perspective it is probably even a better approach.

Eric

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 0608581967f0..1b30bb78b863 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -205,6 +205,12 @@ struct sigframe {
 	int			abigap[56];
 };
 
+#ifdef CONFIG_PPC64
+# define user_siginfo_t		compat_siginfo_t
+#else
+# define user_siginfo_t		siginfo_t
+#endif
+
 /*
  *  When we have rt signals to deliver, we set up on the
  *  user stack, going down from the original stack pointer:
@@ -217,11 +223,7 @@ struct sigframe {
  *
  */
 struct rt_sigframe {
-#ifdef CONFIG_PPC64
-	compat_siginfo_t info;
-#else
-	struct siginfo info;
-#endif
+	user_siginfo_t info;
 	struct ucontext	uc;
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	struct ucontext	uc_transact;
@@ -712,7 +714,7 @@ static long restore_tm_user_regs(struct pt_regs *regs, struct mcontext __user *s
 
 #ifdef CONFIG_PPC64
 
-#define copy_siginfo_to_user	copy_siginfo_to_user32
+#define copy_siginfo_to_external	copy_siginfo_to_external32
 
 #endif /* CONFIG_PPC64 */
 
@@ -731,6 +733,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	struct pt_regs *regs = tsk->thread.regs;
 	/* Save the thread's msr before get_tm_stackpointer() changes it */
 	unsigned long msr = regs->msr;
+	user_siginfo_t uinfo;
 
 	/* Set up Signal Frame */
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 1);
@@ -743,6 +746,8 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	else
 		prepare_save_user_regs(1);
 
+	copy_siginfo_to_external(&uinfo, &ksig->info);
+
 	if (!user_access_begin(frame, sizeof(*frame)))
 		goto badframe;
 
@@ -778,12 +783,10 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 		asm("dcbst %y0; sync; icbi %y0; sync" :: "Z" (mctx->mc_pad[0]));
 	}
 	unsafe_put_sigset_t(&frame->uc.uc_sigmask, oldset, failed);
+	unsafe_copy_to_user(&frame->info, &uinfo, failed);
 
 	user_access_end();
 
-	if (copy_siginfo_to_user(&frame->info, &ksig->info))
-		goto badframe;
-
 	regs->link = tramp;
 
 #ifdef CONFIG_PPC_FPU_REGS

Eric

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E352DC2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 20:00:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3yLl49c2z3bTR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 04:00:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3yLJ2461z2xKs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 03:59:50 +1000 (AEST)
Received: from in02.mta.xmission.com ([166.70.13.52]:36212)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1nrkR5-00ENiG-OH; Thu, 19 May 2022 11:59:43 -0600
Received: from ip68-227-174-4.om.om.cox.net ([68.227.174.4]:38802
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1nrkR3-006e82-PA; Thu, 19 May 2022 11:59:43 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Baoquan He <bhe@redhat.com>
References: <20220518181828.645877-1-naveen.n.rao@linux.vnet.ibm.com>
 <87ee0q7b92.fsf@email.froward.int.ebiederm.org>
 <YoWySwbszfdZS9LU@MiWiFi-R3L-srv>
Date: Thu, 19 May 2022 12:59:17 -0500
In-Reply-To: <YoWySwbszfdZS9LU@MiWiFi-R3L-srv> (Baoquan He's message of "Thu, 
 19 May 2022 10:58:19 +0800")
Message-ID: <87bkvt4d56.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1nrkR3-006e82-PA; ; ;
 mid=<87bkvt4d56.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.174.4; ; ; frm=ebiederm@xmission.com;
 ; ; spf=softfail
X-XM-AID: U2FsdGVkX1/rSxyKigaHMoSccMUFZ8spyBuVsjtCT6w=
X-SA-Exim-Connect-IP: 68.227.174.4
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa01.xmission.com
X-Spam-Level: ******
X-Spam-Status: No, score=6.7 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,TR_Symld_Words,T_SCC_BODY_TEXT_LINE,
 T_TM2_M_HEADER_IN_MSG,XMGappySubj_01,XMSubLong,XMSubMetaSSxObfu_00,
 XM_SPF_SoftFail autolearn=disabled version=3.4.2
X-Spam-Virus: No
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4999]
 *  1.5 TR_Symld_Words too many words that have symbols inside
 *  0.5 XMGappySubj_01 Very gappy subject
 *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa01 1397; Body=1 Fuz1=1 Fuz2=1]
 * -0.0 T_SCC_BODY_TEXT_LINE No description available.
 *  2.5 XM_SPF_SoftFail SPF-SoftFail
 *  1.6 XMSubMetaSSxObfu_00 Obfuscated Sorta Sexy Verb
X-Spam-DCC: XMission; sa01 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ******;Baoquan He <bhe@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1394 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 4.8 (0.3%), b_tie_ro: 3.3 (0.2%), parse: 1.12
 (0.1%), extract_message_metadata: 12 (0.8%), get_uri_detail_list: 2.8
 (0.2%), tests_pri_-1000: 8 (0.6%), tests_pri_-950: 1.07 (0.1%),
 tests_pri_-900: 0.77 (0.1%), tests_pri_-90: 48 (3.4%), check_bayes: 47
 (3.4%), b_tokenize: 6 (0.4%), b_tok_get_all: 8 (0.6%), b_comp_prob:
 1.84 (0.1%), b_tok_touch_all: 28 (2.0%), b_finish: 0.75 (0.1%),
 tests_pri_0: 1308 (93.8%), check_dkim_signature: 0.40 (0.0%),
 check_dkim_adsp: 2.8 (0.2%), poll_dns_idle: 0.24 (0.0%), tests_pri_10:
 1.78 (0.1%), tests_pri_500: 6 (0.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
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
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Baoquan He <bhe@redhat.com> writes:

> Hi Eric,
>
> On 05/18/22 at 04:59pm, Eric W. Biederman wrote:
>> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>> 
>> > Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
>> > symbols") [1], binutils (v2.36+) started dropping section symbols that
>> > it thought were unused.  This isn't an issue in general, but with
>> > kexec_file.c, gcc is placing kexec_arch_apply_relocations[_add] into a
>> > separate .text.unlikely section and the section symbol ".text.unlikely"
>> > is being dropped. Due to this, recordmcount is unable to find a non-weak
>> > symbol in .text.unlikely to generate a relocation record against.
>> >
>> > Address this by dropping the weak attribute from these functions:
>> > - arch_kexec_apply_relocations() is not overridden by any architecture
>> >   today, so just drop the weak attribute.
>> > - arch_kexec_apply_relocations_add() is only overridden by x86 and s390.
>> >   Retain the function prototype for those and move the weak
>> >   implementation into the header as a static inline for other
>> >   architectures.
>> >
>> > [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1
>> 
>> Any chance you can also get machine_kexec_post_load,
>> crash_free_reserved_phys_range, arch_kexec_protect_protect_crashkres,
>> arch_kexec_unprotect_crashkres, arch_kexec_kernel_image_probe,
>> arch_kexec_kernel_image_probe, arch_kimage_file_post_load_cleanup,
>> arch_kexec_kernel_verify_sig, and arch_kexec_locate_mem_hole as well.
>> 
>> That is everything in kexec that uses a __weak symbol.  If we can't
>> count on them working we might as well just get rid of the rest
>> preemptively.
>
> Is there a new rule that __weak is not suggested in kernel any more?
> Please help provide a pointer if yes, so that I can learn that.
>
> In my mind, __weak is very simple and clear as a mechanism to add
> ARCH related functionality.

You should be able to trace the conversation back for all of the details
but if you can't here is the summary.

There is a tool that some architectures use called recordmcount.  The
recordmcount looks for a symbol in a section, and ignores all weak
symbols.  In certain cases sections become so simple there are only weak
symbols.  At which point recordmcount fails.

Which means in practice __weak symbols are unreliable and don't work
to add ARCH related functionality.

Given that __weak symbols fail randomly I would much rather have simpler
code that doesn't fail.  It has never been the case that __weak symbols
have been very common in the kernel.  I expect they are something like
bool that have been gaining traction.  Still given that __weak symbols
don't work.  I don't want them.

Eric

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06F21C621B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 22:33:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GrzJ2cv7zDqjg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:33:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.231;
 helo=out01.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=xmission.com
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Grxg0kHLzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 06:32:21 +1000 (AEST)
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out01.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
 (envelope-from <ebiederm@xmission.com>)
 id 1jW4Eh-0006W8-CV; Tue, 05 May 2020 14:32:15 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1jW4Ef-0006JU-Rg; Tue, 05 May 2020 14:32:15 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20200505101256.3121270-1-hch@lst.de>
 <CAHk-=wgrHhaM1XCB=E3Zp2Br8E5c_kmVUTd5y06xh5sev5nRMA@mail.gmail.com>
Date: Tue, 05 May 2020 15:28:50 -0500
In-Reply-To: <CAHk-=wgrHhaM1XCB=E3Zp2Br8E5c_kmVUTd5y06xh5sev5nRMA@mail.gmail.com>
 (Linus Torvalds's message of "Tue, 5 May 2020 09:52:04 -0700")
Message-ID: <877dxqgm7x.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1jW4Ef-0006JU-Rg; ; ; mid=<877dxqgm7x.fsf@x220.int.ebiederm.org>;
 ; ; hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX19LmJDSmWFKMWb2UuEaurqQBJ8BfhbCMgQ=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa08.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG autolearn=disabled
 version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4975]
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa08 0; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: ; sa08 0; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 983 ms - load_scoreonly_sql: 0.03 (0.0%),
 signal_user_changed: 13 (1.3%), b_tie_ro: 11 (1.1%), parse: 0.73
 (0.1%), extract_message_metadata: 13 (1.4%), get_uri_detail_list: 2.0
 (0.2%), tests_pri_-1000: 6 (0.6%), tests_pri_-950: 1.29 (0.1%),
 tests_pri_-900: 1.07 (0.1%), tests_pri_-90: 219 (22.3%), check_bayes:
 204 (20.7%), b_tokenize: 7 (0.7%), b_tok_get_all: 10 (1.0%),
 b_comp_prob: 3.2 (0.3%), b_tok_touch_all: 179 (18.2%), b_finish: 1.39
 (0.1%), tests_pri_0: 200 (20.4%), check_dkim_signature: 0.45 (0.0%),
 check_dkim_adsp: 2.5 (0.3%), poll_dns_idle: 505 (51.4%), tests_pri_10:
 1.93 (0.2%), tests_pri_500: 524 (53.3%), rewrite_mail: 0.00 (0.0%)
Subject: Re: remove set_fs calls from the coredump code v6
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
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
Cc: Arnd Bergmann <arnd@arndb.de>, the arch/x86 maintainers <x86@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Tue, May 5, 2020 at 3:13 AM Christoph Hellwig <hch@lst.de> wrote:
>>
>> this series gets rid of playing with the address limit in the exec and
>> coredump code.  Most of this was fairly trivial, the biggest changes are
>> those to the spufs coredump code.
>
> Ack, nice, and looks good.
>
> The only part I dislike is how we have that 'struct compat_siginfo' on
> the stack, which is a huge waste (most of it is the nasty padding to
> 128 bytes).
>
> But that's not new, I only reacted to it because the code moved a bit.
> We cleaned up the regular siginfo to not have the padding in the
> kernel (and by "we" I mean "Eric Biederman did it after some prodding
> as part of his siginfo cleanups" - see commit 4ce5f9c9e754 "signal:
> Use a smaller struct siginfo in the kernel"),  and I wonder if we
> could do something similar with that compat thing.
>
> 128 bytes of wasted kernel stack isn't the end of the world, but it's
> sad when the *actual* data is only 32 bytes or so.

We probably can.   After introducing a kernel_compat_siginfo that is
the size that userspace actually would need.

It isn't something I want to mess with until this code gets merged, as I
think the set_fs cleanups are more important.


Christoph made some good points about how ugly the #ifdefs are in
the generic copy_siginfo_to_user32 implementation.

I am thinking the right fix is to introduce.
	- TS_X32 as a companion to TS_COMPAT in the x86_64.
        - Modify in_x32_syscall() to test TS_X32
        - Implement x32_copy_siginfo_to_user32 that forces TS_X32 to be
          set. AKA:
        
	        x32_copy_siginfo_to_user32()
	        {
	        	unsigned long state = current_thread_info()->state;
	                current_thread_info()->state |= TS_X32;
	                copy_siginfo_to_user32();
	                current_thread_info()->state = state;
	        }

That would make the #ifdefs go away, but I don't yet know what the x86
maintainers would say about that scheme.  I think it is a good path as
it would isolate the runtime cost of that weird SIGCHLD siginfo format
to just x32.  Then ia32 in compat mode would not need to pay.

Once I get that then it will be easier to introduce a yet another helper
of copy_siginfo_to_user32 that generates just the kernel_compat_siginfo
part, and the two visible derivatives can call memset and clear_user
to clear the unset parts.

I am assuming you don't don't mind having a full siginfo in
elf_note_info that ultimately gets copied into the core dump?

Eric

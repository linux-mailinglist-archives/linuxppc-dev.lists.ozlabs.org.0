Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A681AE4E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 20:39:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493lHk441BzDrgM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 04:39:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.232;
 helo=out02.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=xmission.com
X-Greylist: delayed 1442 seconds by postgrey-1.36 at bilbo;
 Sat, 18 Apr 2020 04:37:24 AEST
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493lFJ1ZwlzDrg6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 04:37:23 +1000 (AEST)
Received: from in01.mta.xmission.com ([166.70.13.51])
 by out02.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
 (envelope-from <ebiederm@xmission.com>)
 id 1jPVUJ-0004yd-Mc; Fri, 17 Apr 2020 12:13:15 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in01.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1jPVUH-0000Xy-J7; Fri, 17 Apr 2020 12:13:15 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Christoph Hellwig <hch@lst.de>
References: <20200414070142.288696-1-hch@lst.de>
 <20200414070142.288696-5-hch@lst.de>
 <CAK8P3a3HvbPKTkwfWr6PbZ96koO_NrJP1qgk8H1mgk=qUScGkQ@mail.gmail.com>
 <20200415074514.GA1393@lst.de>
 <CAK8P3a0QGQX85LaqKC1UuTERk6Bpr5TW6aWF+jxi2cOpa4L_AA@mail.gmail.com>
 <20200417132714.GA6401@lst.de>
Date: Fri, 17 Apr 2020 13:10:12 -0500
In-Reply-To: <20200417132714.GA6401@lst.de> (Christoph Hellwig's message of
 "Fri, 17 Apr 2020 15:27:14 +0200")
Message-ID: <87o8rqc7az.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1jPVUH-0000Xy-J7; ; ; mid=<87o8rqc7az.fsf@x220.int.ebiederm.org>;
 ; ; hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX18JO8/Ppng68LNpdE4K4Z5+2lJxR7m8FSs=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa03.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 XMGappySubj_01,XMNoVowels,XMSubLong autolearn=disabled version=3.4.2
X-Spam-Virus: No
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4170] *  0.5 XMGappySubj_01 Very gappy subject
 *  0.7 XMSubLong Long Subject
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa03 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa03 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Christoph Hellwig <hch@lst.de>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1652 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 3.5 (0.2%), b_tie_ro: 2.4 (0.1%), parse: 0.62
 (0.0%), extract_message_metadata: 9 (0.5%), get_uri_detail_list: 0.80
 (0.0%), tests_pri_-1000: 3.9 (0.2%), tests_pri_-950: 1.02 (0.1%),
 tests_pri_-900: 0.78 (0.0%), tests_pri_-90: 236 (14.3%), check_bayes:
 234 (14.2%), b_tokenize: 4.6 (0.3%), b_tok_get_all: 149 (9.0%),
 b_comp_prob: 2.5 (0.2%), b_tok_touch_all: 75 (4.6%), b_finish: 0.74
 (0.0%), tests_pri_0: 171 (10.4%), check_dkim_signature: 0.37 (0.0%),
 check_dkim_adsp: 2.7 (0.2%), poll_dns_idle: 1209 (73.2%),
 tests_pri_10: 1.73 (0.1%), tests_pri_500: 1222 (74.0%), rewrite_mail:
 0.00 (0.0%)
Subject: Re: [PATCH 4/8] binfmt_elf: open code copy_siginfo_to_user to
 kernelspace buffer
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
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@lst.de> writes:

> On Wed, Apr 15, 2020 at 10:20:11AM +0200, Arnd Bergmann wrote:
>> > I'd rather keep it out of this series and to
>> > an interested party.  Then again x32 doesn't seem to have a whole lot
>> > of interested parties..
>> 
>> Fine with me. It's on my mental list of things that we want to kill off
>> eventually as soon as the remaining users stop replying to questions
>> about it.
>> 
>> In fact I should really turn that into a properly maintained list in
>> Documentation/... that contains any options that someone has
>> asked about removing in the past, along with the reasons for keeping
>> it around and a time at which we should ask about it again.
>
> To the newly added x86 maintainers:  Arnd brought up the point that
> elf_core_dump writes the ABI siginfo format into the core dump. That
> format differs for i386 vs x32.  Is there any good way to find out
> which is the right format when are not in a syscall?
>
> As far a I can tell x32 vs i386 just seems to be based around what
> syscall table was used for the current syscall, but core dumps aren't
> always in syscall context.

I don't think this matters.  The i386 and x32 signal structures
only differ for SIGCHLD.  The SIGCHLD signal does cause coredumps.
So as long as we get the 32bit vs 64bit distinct correct all should be
well.

Eric




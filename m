Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCFC52A7B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 18:14:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2h5j1g7Rz3cFb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 02:14:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.233;
 helo=out03.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 2428 seconds by postgrey-1.36 at boromir;
 Wed, 18 May 2022 02:14:06 AEST
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2h5B1BJkz2xh0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 02:14:05 +1000 (AEST)
Received: from in01.mta.xmission.com ([166.70.13.51]:56996)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1nqzCV-008zaP-Nq; Tue, 17 May 2022 09:33:31 -0600
Received: from ip68-227-174-4.om.om.cox.net ([68.227.174.4]:38502
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1nqzCU-00CBh4-Iq; Tue, 17 May 2022 09:33:31 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
References: <20220425174128.11455-1-naveen.n.rao@linux.vnet.ibm.com>
 <YoNqJ/MOSIVwKP/o@MiWiFi-R3L-srv>
 <1652782155.56t7mah8ib.naveen@linux.ibm.com>
Date: Tue, 17 May 2022 10:32:18 -0500
In-Reply-To: <1652782155.56t7mah8ib.naveen@linux.ibm.com> (Naveen N. Rao's
 message of "Tue, 17 May 2022 15:49:41 +0530")
Message-ID: <8735h8b2f1.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1nqzCU-00CBh4-Iq; ; ;
 mid=<8735h8b2f1.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.174.4; ; ; frm=ebiederm@xmission.com;
 ; ; spf=softfail
X-XM-AID: U2FsdGVkX1+Rsm9jiHl7RP207+UxFb0FJ9BaNggLsNY=
X-SA-Exim-Connect-IP: 68.227.174.4
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa05.xmission.com
X-Spam-Level: ******
X-Spam-Status: No, score=6.7 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,TR_Symld_Words,T_TM2_M_HEADER_IN_MSG,XMGappySubj_01,
 XMSubLong,XMSubMetaSSxObfu_00,XM_SPF_SoftFail autolearn=disabled
 version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4965] *  0.7 XMSubLong Long Subject
 *  0.5 XMGappySubj_01 Very gappy subject
 *  1.5 TR_Symld_Words too many words that have symbols inside
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa05 1397; Body=1 Fuz1=1 Fuz2=1]
 *  1.6 XMSubMetaSSxObfu_00 Obfuscated Sorta Sexy Verb
 *  2.5 XM_SPF_SoftFail SPF-SoftFail
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ******;"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 510 ms - load_scoreonly_sql: 0.12 (0.0%),
 signal_user_changed: 13 (2.6%), b_tie_ro: 11 (2.2%), parse: 1.65
 (0.3%), extract_message_metadata: 7 (1.4%), get_uri_detail_list: 3.2
 (0.6%), tests_pri_-1000: 6 (1.1%), tests_pri_-950: 1.93 (0.4%),
 tests_pri_-900: 1.52 (0.3%), tests_pri_-90: 162 (31.8%), check_bayes:
 159 (31.3%), b_tokenize: 10 (2.0%), b_tok_get_all: 9 (1.8%),
 b_comp_prob: 4.0 (0.8%), b_tok_touch_all: 132 (25.8%), b_finish: 1.16
 (0.2%), tests_pri_0: 289 (56.7%), check_dkim_signature: 0.89 (0.2%),
 check_dkim_adsp: 3.5 (0.7%), poll_dns_idle: 0.73 (0.1%), tests_pri_10:
 2.8 (0.5%), tests_pri_500: 12 (2.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] kexec_file: Drop pr_err in weak implementations of
 arch_kexec_apply_relocations[_add]
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
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
Cc: linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Looking at this the pr_err is absolutely needed.  If an unsupported case
winds up in the purgatory blob and the code can't handle it things
will fail silently much worse later.  So the proposed patch is
unfortunately the wrong direction.

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:

> Baoquan He wrote:
>> On 04/25/22 at 11:11pm, Naveen N. Rao wrote:
>>> kexec_load_purgatory() can fail for many reasons - there is no need to
>>> print an error when encountering unsupported relocations.
>>> This solves a build issue on powerpc with binutils v2.36 and newer [1].
>>> Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
>>> symbols") [2], binutils started dropping section symbols that it thought
>> I am not familiar with binutils, while wondering if this exists in other
>> ARCHes except of ppc. Arm64 doesn't have the ARCH override either, do we
>> have problem with it?
>
> I'm not aware of this specific file causing a problem on other architectures -
> perhaps the config options differ enough. There are however more reports of
> similar issues affecting other architectures with the llvm integrated assembler:
> https://github.com/ClangBuiltLinux/linux/issues/981
>
>> 
>>> were unused.  This isn't an issue in general, but with kexec_file.c, gcc
>>> is placing kexec_arch_apply_relocations[_add] into a separate
>>> .text.unlikely section and the section symbol ".text.unlikely" is being
>>> dropped. Due to this, recordmcount is unable to find a non-weak symbol
>> But arch_kexec_apply_relocations_add is weak symbol on ppc.
>
> Yes. Note that it is just the section symbol that gets dropped. The section is
> still present and will continue to hold the symbols for the functions
> themselves.

So we have a case where binutils thinks it is doing something useful
and our kernel specific tool gets tripped up by it.

Reading the recordmcount code it looks like it is finding any symbol
within a section but ignoring weak symbols.  So I suspect the only
remaining symbol in the section is __weak and that confuses
recordmcount.

Does removing the __weak annotation on those functions fix the build
error?  If so we can restructure the kexec code to simply not use __weak
symbols.

Otherwise the fix needs to be in recordmcount or binutils, and we should
loop whoever maintains recordmcount in to see what they can do.

Eric

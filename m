Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35B409CB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 21:11:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7bgt2Yvwz3056
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 05:11:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.231;
 helo=out01.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7bgQ4B44z2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 05:11:29 +1000 (AEST)
Received: from in01.mta.xmission.com ([166.70.13.51]:36900)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mPrMP-00ElnJ-GI; Mon, 13 Sep 2021 13:11:21 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:56012
 helo=email.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mPrMO-005M8J-FP; Mon, 13 Sep 2021 13:11:21 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <96d06ad9-5a9b-b8c3-3c1d-ed8837091a60@csgroup.eu> (Christophe
 Leroy's message of "Mon, 13 Sep 2021 19:19:26 +0200")
References: <1718f38859d5366f82d5bef531f255cedf537b5d.1631537060.git.christophe.leroy@csgroup.eu>
 <2b179deba4fd4ec0868cdc48a0230dfa3aa5a22f.1631537060.git.christophe.leroy@csgroup.eu>
 <87h7eopixa.fsf@disp2133> <87y280o38q.fsf@disp2133>
 <96d06ad9-5a9b-b8c3-3c1d-ed8837091a60@csgroup.eu>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Mon, 13 Sep 2021 14:11:11 -0500
Message-ID: <87ilz4mgts.fsf@disp2133>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-XM-SPF: eid=1mPrMO-005M8J-FP; ; ; mid=<87ilz4mgts.fsf@disp2133>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+hWNysB++Rsib0OIhE7QHm4S4VuIjrA7E=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 T_TooManySym_02,T_TooManySym_03,XMGappySubj_01,XMGappySubj_02,
 XMSubLong,XM_B_SpammyTLD,XM_B_SpammyWords,XM_B_Unicode,XM_B_Unicode3
 autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4113] *  0.7 XMSubLong Long Subject
 *  0.5 XMGappySubj_01 Very gappy subject
 *  1.0 XMGappySubj_02 Gappier still
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 *  0.0 XM_B_Unicode BODY: Testing for specific types of unicode
 *  0.0 XM_B_Unicode3 BODY: Testing for specific types of unicode
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 *  0.2 XM_B_SpammyWords One or more commonly used spammy words
 *  1.0 XM_B_SpammyTLD Contains uncommon/spammy TLD
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;Christophe Leroy <christophe.leroy@csgroup.eu>
X-Spam-Relay-Country: 
X-Spam-Timing: total 475 ms - load_scoreonly_sql: 0.03 (0.0%),
 signal_user_changed: 11 (2.2%), b_tie_ro: 9 (1.9%), parse: 0.90 (0.2%),
 extract_message_metadata: 15 (3.2%), get_uri_detail_list: 1.62 (0.3%),
 tests_pri_-1000: 21 (4.5%), tests_pri_-950: 1.24 (0.3%),
 tests_pri_-900: 1.00 (0.2%), tests_pri_-90: 134 (28.2%), check_bayes:
 131 (27.6%), b_tokenize: 7 (1.5%), b_tok_get_all: 8 (1.6%),
 b_comp_prob: 2.4 (0.5%), b_tok_touch_all: 110 (23.2%), b_finish: 0.85
 (0.2%), tests_pri_0: 276 (58.1%), check_dkim_signature: 0.53 (0.1%),
 check_dkim_adsp: 2.6 (0.5%), poll_dns_idle: 0.40 (0.1%), tests_pri_10:
 2.8 (0.6%), tests_pri_500: 9 (2.0%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH RESEND v3 6/6] powerpc/signal: Use
 unsafe_copy_siginfo_to_user()
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
Cc: linux-kernel@vger.kernel.org, hch@infradead.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 13/09/2021 =C3=A0 18:21, Eric W. Biederman a =C3=A9crit=C2=A0:
>> ebiederm@xmission.com (Eric W. Biederman) writes:
>>
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>
>>>> Use unsafe_copy_siginfo_to_user() in order to do the copy
>>>> within the user access block.
>>>>
>>>> On an mpc 8321 (book3s/32) the improvment is about 5% on a process
>>>> sending a signal to itself.
>>
>> If you can't make function calls from an unsafe macro there is another
>> way to handle this that doesn't require everything to be inline.
>>
>>  From a safety perspective it is probably even a better approach.
>
> Yes but that's exactly what I wanted to avoid for the native ppc32 case: =
this
> double hop means useless pressure on the cache. The siginfo_t structure i=
s 128
> bytes large, that means 8 lines of cache on powerpc 8xx.
>
> But maybe it is acceptable to do that only for the compat case. Let me th=
ink
> about it, it might be quite easy.

The places get_signal is called tend to be well known.  So I think we
are safe from a capacity standpoint.

I am not certain it makes a difference in capacity as there is a high
probability that the stack was deeper recently than it is now which
suggests the cache blocks might already be in the cache.

My sense it is worth benchmarking before optimizing out the extra copy
like that.

On the extreme side there is simply building the entire sigframe on the
stack and then just calling it copy_to_user.  As the stack cache lines
are likely to be hot, and copy_to_user is quite well optimized
there is a real possibility that it is faster to build everything
on the kernel stack, and then copy it to the user space stack.

It is also possible that I am wrong and we may want to figure out how
far up we can push the conversion to the 32bit siginfo format.

If could move the work into collect_signal we could guarantee there
would be no extra work.  That would require adjusting the sigframe
generation code on all of the architectures.

There is a lot we can do but we need benchmarking to tell if it is
worth it.

Eric






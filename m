Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938A40794D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 18:01:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H6HYP2Sd8z3050
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Sep 2021 02:01:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.232;
 helo=out02.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H6HXs0XT6z2yJ6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Sep 2021 02:01:15 +1000 (AEST)
Received: from in02.mta.xmission.com ([166.70.13.52]:40280)
 by out02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mP5RF-008tcN-2o; Sat, 11 Sep 2021 10:01:09 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:59180
 helo=email.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mP5RD-00Cy6k-Pa; Sat, 11 Sep 2021 10:01:08 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
 <a94be61f008ab29c231b805e1a97e9dab35cb0cc.1629732940.git.christophe.leroy@csgroup.eu>
 <87mtoux1hi.fsf@disp2133>
 <2715792c-eb10-eeb8-3d49-24486abe953b@csgroup.eu>
 <877dfrrkxo.fsf@disp2133>
 <7caf5127-36fc-7c77-00f1-7be82d6f26e0@csgroup.eu>
Date: Sat, 11 Sep 2021 10:58:07 -0500
In-Reply-To: <7caf5127-36fc-7c77-00f1-7be82d6f26e0@csgroup.eu> (Christophe
 Leroy's message of "Fri, 10 Sep 2021 10:27:03 +0000")
Message-ID: <87o88zqf3k.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-XM-SPF: eid=1mP5RD-00Cy6k-Pa; ; ; mid=<87o88zqf3k.fsf@disp2133>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX19hYD/xpx2pe+945cUwL0rmu0uHytZHhSc=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=8.0 tests=ALL_TRUSTED,BAYES_40,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 T_TooManySym_02,T_TooManySym_03,XMGappySubj_01,XMGappySubj_02,
 XMSubLong,XM_B_SpammyTLD,XM_B_SpammyWords,XM_B_Unicode,XM_B_Unicode3
 autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
 *      [score: 0.2431] *  0.5 XMGappySubj_01 Very gappy subject
 *  1.0 XMGappySubj_02 Gappier still
 *  0.7 XMSubLong Long Subject
 *  0.0 XM_B_Unicode3 BODY: Testing for specific types of unicode
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 *  0.0 XM_B_Unicode BODY: Testing for specific types of unicode
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  0.2 XM_B_SpammyWords One or more commonly used spammy words
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 *  1.0 XM_B_SpammyTLD Contains uncommon/spammy TLD
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Christophe Leroy <christophe.leroy@csgroup.eu>
X-Spam-Relay-Country: 
X-Spam-Timing: total 433 ms - load_scoreonly_sql: 0.05 (0.0%),
 signal_user_changed: 9 (2.1%), b_tie_ro: 8 (1.8%), parse: 1.48 (0.3%),
 extract_message_metadata: 18 (4.2%), get_uri_detail_list: 2.8 (0.7%),
 tests_pri_-1000: 13 (2.9%), tests_pri_-950: 1.27 (0.3%),
 tests_pri_-900: 1.01 (0.2%), tests_pri_-90: 73 (16.8%), check_bayes:
 71 (16.4%), b_tokenize: 8 (1.8%), b_tok_get_all: 8 (1.7%),
 b_comp_prob: 2.4 (0.6%), b_tok_touch_all: 49 (11.4%), b_finish: 0.83
 (0.2%), tests_pri_0: 301 (69.5%), check_dkim_signature: 0.57 (0.1%),
 check_dkim_adsp: 2.3 (0.5%), poll_dns_idle: 0.33 (0.1%), tests_pri_10:
 2.0 (0.5%), tests_pri_500: 9 (2.0%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2 3/5] signal: Add unsafe_copy_siginfo_to_user()
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> On 9/8/21 6:17 PM, Eric W. Biederman wrote:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>
>>> Le 02/09/2021 =C3=A0 20:43, Eric W. Biederman a =C3=A9crit=C2=A0:
>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>
>>>>> In the same spirit as commit fb05121fd6a2 ("signal: Add
>>>>> unsafe_get_compat_sigset()"), implement an 'unsafe' version of
>>>>> copy_siginfo_to_user() in order to use it within user access blocks.
>>>>>
>>>>> For that, also add an 'unsafe' version of clear_user().
>>>>
>>>> Looking at your use cases you need the 32bit compat version of this
>>>> as well.
>>>>
>>>> The 32bit compat version is too complicated to become a macro, so I
>>>> don't think you can make this work correctly for the 32bit compat case.
>>>
>>> When looking into patch 5/5 that you nacked, I think you missed the fac=
t that we
>>> keep using copy_siginfo_to_user32() as it for the 32 bit compat case.
>>
>> I did.  My mistake.
>>
>> However that mistake was so easy I think it mirrors the comments others
>> have made that this looks like a maintenance hazard.
>>
>> Is improving the performance of 32bit kernels interesting?
>
> Yes it is, and that's what this series do.
>
>> Is improving the performance of 32bit compat support interesting?
>
> For me this is a corner case, so I left it aside for now.
>
>>
>> If performance one or either of those cases is interesting it looks like
>> we already have copy_siginfo_to_external32 the factor you would need
>> to build unsafe_copy_siginfo_to_user32.
>
> I'm not sure I understand your saying here. What do you expect me to
> do with copy_siginfo_to_external32() ?

Implement unsafe_copy_siginfo_to_user32.

> copy_siginfo_to_user32() is for compat only.
>
> Native 32 bits powerpc use copy_siginfo_to_user()

What you implemented doubles the number of test cases necessary to
compile test the 32bit ppc signal code, and makes the code noticeably
harder to follow.

Having a unsafe_copy_to_siginfo_to_user32 at least would allow the
number of test cases to remain the same as the current code.

>> So I am not going to say impossible but please make something
>> maintainable.  I unified all of the compat 32bit siginfo logic because
>> it simply did not get enough love and attention when it was implemented
>> per architecture.
>
> Yes, and ? I didn't do any modification to the compat case, so what
> you did remains.

You undid the unification between the 32bit code and the 32bit compat
code.

>> In general I think that concern applies to this case as well.  We really
>> need an implementation that shares as much burden as possible with other
>> architectures.
>
> I think yes, that's the reason why I made a generic
> unsafe_copy_siginfo_to_user() and didn't make a powerpc dedicated
> change.
>
> Once this is merged any other architecture can use
> unsafe_copy_siginfo_to_user().
>
> Did I miss something ?

Not dealing with the compat case and making the code signal stack frame
code noticeably more complicated.

If this optimization profitably applies to other architectures we need
to figure out how to implement unsafe_copy_siginfo_to_user32 or risk
making them all much worse to maintain.

Eric

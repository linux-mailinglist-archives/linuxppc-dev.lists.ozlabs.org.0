Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F75533B4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 13:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Sy803ryz3cFH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 21:09:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MkmM3JkY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MkmM3JkY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7SmH4K2Zz2y7V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 21:01:03 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24P8X8lr001819;
 Wed, 25 May 2022 11:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=pp1; bh=v30RAzu0pmztxKiLoTeEHBpD/pNQmgeE4NQFH4FjzIU=;
 b=MkmM3JkYlb+RjnsH1yVt2nY7/gMJQ6UvniwbEYWny3aQQ9ijiStkCNPYzAUX6cvaifdv
 fEJn0uivrCW+QMDt48Xx1mmsTNB91ppg+5ilh9VnjqY3UI3L5aCCpn09IYhSmt3h6bg1
 /MfRBXSVxaAUrNnHW1IOt3QepylRaH+Wllrc0+aw8QdEieON8TRCkp22GtGYgStXKUz1
 sLG5fZSvUXhE9tVf5VBa6ZXYNCnPRMitSB2+UU80GarQcHuYnq2Z24jKwG/8AQ2PUV69
 eAEAdgFPxwIV/mCPArvNe+8dBOxQS2LROrjHWKBk8/vXnep9UWLx2PZPA5UP5KqBsY++ BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9fuu3w4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 11:00:47 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24PArNb2029847;
 Wed, 25 May 2022 11:00:45 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9fuu3w39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 11:00:45 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PAwkbW026506;
 Wed, 25 May 2022 11:00:43 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3g93uw919t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 11:00:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24PAkW6G42467786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 10:46:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A98F44C040;
 Wed, 25 May 2022 11:00:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A09034C044;
 Wed, 25 May 2022 11:00:36 +0000 (GMT)
Received: from [9.43.54.165] (unknown [9.43.54.165])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 11:00:36 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------OiF0gun0GxmZU3zFlP9iz0et"
Message-ID: <cd006053-1bf2-eea0-dd82-9b0b997793df@linux.vnet.ibm.com>
Date: Wed, 25 May 2022 16:30:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 5/7] objtool: Enable objtool to run only on files
 with ftrace enabled
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <cover.1653398233.git.christophe.leroy@csgroup.eu>
 <cf3013dfad89ad5ac7d16d56dced72d7c138a20e.1653398233.git.christophe.leroy@csgroup.eu>
 <Yo0dgyqAOuwU6gHq@hirez.programming.kicks-ass.net>
 <Yo0dpDuK3ilphNAA@hirez.programming.kicks-ass.net>
 <5cb959a2-7e88-5aff-2f8e-be8fdecd002c@csgroup.eu>
 <Yo03Flwa1s+o6wda@hirez.programming.kicks-ass.net>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <Yo03Flwa1s+o6wda@hirez.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4YqMvogko2I9d6pEBVuF8i522KJHvBDN
X-Proofpoint-GUID: ew1g5_wJwFglrHLWsTpvi7cQPaFylRc0
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_03,2022-05-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250051
X-Mailman-Approved-At: Wed, 25 May 2022 21:09:00 +1000
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "sv@linux.ibm.com" <sv@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------OiF0gun0GxmZU3zFlP9iz0et
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Peter,

On 25/05/22 01:20, Peter Zijlstra wrote:
> On Tue, May 24, 2022 at 06:59:50PM +0000, Christophe Leroy wrote:
>>
>> Le 24/05/2022 à 20:02, Peter Zijlstra a écrit :
>>> On Tue, May 24, 2022 at 08:01:39PM +0200, Peter Zijlstra wrote:
>>>> On Tue, May 24, 2022 at 03:17:45PM +0200, Christophe Leroy wrote:
>>>>> From: Sathvika Vasireddy<sv@linux.ibm.com>
>>>>>
>>>>> This patch makes sure objtool runs only on the object files
>>>>> that have ftrace enabled, instead of running on all the object
>>>>> files.
>>>>>
>>>>> Signed-off-by: Naveen N. Rao<naveen.n.rao@linux.vnet.ibm.com>
>>>>> Signed-off-by: Sathvika Vasireddy<sv@linux.ibm.com>
>>>>> Signed-off-by: Christophe Leroy<christophe.leroy@csgroup.eu>
>>>>> ---
>>>>>    scripts/Makefile.build | 4 ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>>>>> index 2e0c3f9c1459..06ceffd92921 100644
>>>>> --- a/scripts/Makefile.build
>>>>> +++ b/scripts/Makefile.build
>>>>> @@ -258,8 +258,8 @@ else
>>>>>    # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
>>>>>    # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
>>>>>    
>>>>> -$(obj)/%.o: objtool-enabled = $(if $(filter-out y%, \
>>>>> -	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y)
>>>>> +$(obj)/%.o: objtool-enabled = $(and $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y),        \
>>>>> +        $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),y),y)
>>>> I think this breaks x86, quite a bit of files have ftrace disabled but
>>>> very much must run objtool anyway.
>>> Also; since the Changelog gives 0 clue as to what problem it's trying to
>>> solve, I can't suggest anything.
>> I asked Sathvika on the previous series, see
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220523175548.922671-3-sv@linux.ibm.com/
>>
>> He says it is to solve the problem I reported at
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220318105140.43914-4-sv@linux.ibm.com/#2861128
> So on x86 we have:
>
> arch/x86/entry/vdso/Makefile:OBJECT_FILES_NON_STANDARD       := y
>
> to kill objtool for the whole of the VDSO. When we run objtool on
> vmlinux it isn't a problem, because the VDSO ends up as a data section
> through linker scripts.
Right.. Like you and Christophe mentioned,
arch/powerpc/kernel/vdso/Makefile:OBJECT_FILES_NON_STANDARD := y
should solve it for powerpc as well.


I'll drop this patch and replace it with the above change as part of next
revision series.


Thanks for reviewing!



- Sathvika


--------------OiF0gun0GxmZU3zFlP9iz0et
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hi Peter, </font><br>
    </p>
    <div class="moz-cite-prefix"><font face="monospace">On 25/05/22
        01:20, Peter Zijlstra wrote:</font><br>
    </div>
    <blockquote type="cite"
      cite="mid:Yo03Flwa1s+o6wda@hirez.programming.kicks-ass.net">
      <pre class="moz-quote-pre" wrap="">On Tue, May 24, 2022 at 06:59:50PM +0000, Christophe Leroy wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

Le 24/05/2022 à 20:02, Peter Zijlstra a écrit :
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Tue, May 24, 2022 at 08:01:39PM +0200, Peter Zijlstra wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Tue, May 24, 2022 at 03:17:45PM +0200, Christophe Leroy wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">From: Sathvika Vasireddy <a class="moz-txt-link-rfc2396E" href="mailto:sv@linux.ibm.com">&lt;sv@linux.ibm.com&gt;</a>

This patch makes sure objtool runs only on the object files
that have ftrace enabled, instead of running on all the object
files.

Signed-off-by: Naveen N. Rao <a class="moz-txt-link-rfc2396E" href="mailto:naveen.n.rao@linux.vnet.ibm.com">&lt;naveen.n.rao@linux.vnet.ibm.com&gt;</a>
Signed-off-by: Sathvika Vasireddy <a class="moz-txt-link-rfc2396E" href="mailto:sv@linux.ibm.com">&lt;sv@linux.ibm.com&gt;</a>
Signed-off-by: Christophe Leroy <a class="moz-txt-link-rfc2396E" href="mailto:christophe.leroy@csgroup.eu">&lt;christophe.leroy@csgroup.eu&gt;</a>
---
  scripts/Makefile.build | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2e0c3f9c1459..06ceffd92921 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -258,8 +258,8 @@ else
  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
  
-$(obj)/%.o: objtool-enabled = $(if $(filter-out y%, \
-	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y)
+$(obj)/%.o: objtool-enabled = $(and $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y),        \
+        $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),y),y)
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
I think this breaks x86, quite a bit of files have ftrace disabled but
very much must run objtool anyway.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Also; since the Changelog gives 0 clue as to what problem it's trying to
solve, I can't suggest anything.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I asked Sathvika on the previous series, see 
<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220523175548.922671-3-sv@linux.ibm.com/">https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220523175548.922671-3-sv@linux.ibm.com/</a>

He says it is to solve the problem I reported at 
<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220318105140.43914-4-sv@linux.ibm.com/#2861128">https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220318105140.43914-4-sv@linux.ibm.com/#2861128</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So on x86 we have:

arch/x86/entry/vdso/Makefile:OBJECT_FILES_NON_STANDARD       := y

to kill objtool for the whole of the VDSO. When we run objtool on
vmlinux it isn't a problem, because the VDSO ends up as a data section
through linker scripts.
</pre>
    </blockquote>
    <font face="monospace">Right.. Like you and Christophe mentioned, </font><br>
    <font face="monospace">arch/powerpc/kernel/vdso/Makefile:OBJECT_FILES_NON_STANDARD
      := y</font><br>
    <font face="monospace">should solve it for powerpc as well. <br>
    </font><br>
    <br>
    <font face="monospace">I'll drop this patch and replace it with the
      above change as part of next</font><br>
    <font face="monospace">revision series. <br>
    </font><font face="monospace"><br>
    </font><br>
    <font face="monospace">Thanks for reviewing! <br>
    </font><br>
    <font face="monospace"><br>
    </font><br>
    <font face="monospace">- Sathvika</font><br>
    <div class="c-message_actions__container c-message__actions"
      role="group" style="box-sizing: inherit; display: inline-flex;
      position: absolute; right: 17px; top: -16px; z-index: 1; color:
      rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions,
      appleLogo, sans-serif; font-size: 15px; font-style: normal;
      font-variant-ligatures: common-ligatures; font-variant-caps:
      normal; font-weight: 400; letter-spacing: normal; orphans: 2;
      text-align: start; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 2; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(248, 248,
      248); text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
      <div class="c-message_actions__group" role="group"
        aria-label="Message shortcuts" data-qa="message-actions"
        style="box-sizing: inherit;
        --saf-0:rgba(var(--sk_foreground_low,29,28,29),0.13);
        background: rgba(var(--sk_primary_background,255,255,255),1);
        border: unset; border-radius: 0.375em; box-shadow: 0 0 0 1px
        var(--saf-0),0 1px 3px 0 #00000014; display: flex; line-height:
        1; margin-left: 8px; padding: 2px;"><button
          class="c-button-unstyled c-icon_button c-icon_button--light
          c-icon_button--size_small c-message_actions__button"
          aria-label="Add reaction" aria-haspopup="true"
          data-qa="add_reaction_action" data-focus-key="message_actions"
data-focus-metadata="{&quot;button&quot;:&quot;reaction&quot;,&quot;channelId&quot;:&quot;D028LG8V275&quot;,&quot;ts&quot;:&quot;1653474154.964119&quot;,&quot;messageContainerType&quot;:&quot;message-pane&quot;}"
          data-sk="tooltip_parent" type="button" tabindex="-1"
          data-remove-tab-index="true" style="box-sizing: inherit;
          padding: 0px; background: none; border: 0px; cursor: pointer;
          font: inherit; color:
          rgba(var(--sk_foreground_max,29,28,29),0.7); margin: 0px;
          overflow: initial; text-align: initial; vertical-align:
          initial; align-items: center; border-radius: 4px; display:
          inline-flex; justify-content: center; position: relative;
          height: 32px; width: 32px;"><br
            class="Apple-interchange-newline">
          <br>
        </button></div>
    </div>
  </body>
</html>

--------------OiF0gun0GxmZU3zFlP9iz0et--


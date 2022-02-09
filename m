Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 859A64AE638
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 01:46:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jth5M1xYwz2yK6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 11:46:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j6uouoOO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j6uouoOO; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtgX96P3Xz2yLM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 11:20:56 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 218L5M7Q037990; 
 Wed, 9 Feb 2022 00:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=pp1; bh=+6Ch3ax1Mk6CAVrMM072C8vHDXgkYP3g98z1IUhkWRs=;
 b=j6uouoOOP3tn9X0hfkkXQVsi75INyWYOmLOUhBx4IjMLRD+NYCXOp5yrO3e+bGduUZrZ
 rin6goru1wRRjogDIqmrOymdUiemPCkpQx/zvxh6H8pctt4FlZOuzvqZAUQMis7GMRJX
 wKjpBnlD11fVJULhqEFzGDXCvpR7zUzmJHQKMQRWmNjoe4+/ME1NiY41mkxTkJz2/JOA
 X2rlQEW5DG7hRmNCTOL+34//UKXzRfyE6lvXMbv0LrcC6l/04Oad9InoB6vgd7cVlbEW
 NbXtF/tpQKuFL+JV5fdMNdtvtIoOVAnW2d+dYX5NuxzZuiuxVN4rfT0PyG+Ghm9XGEGL UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3wmjxukc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 00:19:26 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21905OOw011842;
 Wed, 9 Feb 2022 00:19:25 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3wmjxujx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 00:19:25 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2190Hb3p011321;
 Wed, 9 Feb 2022 00:19:24 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3e2btak25p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 00:19:24 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2190JKqS26935752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Feb 2022 00:19:21 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0650C605D;
 Wed,  9 Feb 2022 00:19:20 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CDA2C6057;
 Wed,  9 Feb 2022 00:19:19 +0000 (GMT)
Received: from [9.211.92.120] (unknown [9.211.92.120])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  9 Feb 2022 00:19:18 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------CciYVwa1O0LnsD73ZUULIc62"
Message-ID: <4e28763d-f397-c415-bb5f-02bdd35a0f76@linux.vnet.ibm.com>
Date: Tue, 8 Feb 2022 19:19:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 0/5] Allow guest access to EFI confidential computing
 secret area
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>, linux-efi@vger.kernel.org
References: <20220201124413.1093099-1-dovmurik@linux.ibm.com>
 <Yfk6vEuZFtgtA+G+@kroah.com>
 <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
 <20220202040157.GA8019@srcf.ucam.org> <YfogOurPZb7+Yelo@kroah.com>
 <20220202065443.GA9249@srcf.ucam.org> <YfotMyQiQ66xfCOQ@kroah.com>
 <20220202071023.GA9489@srcf.ucam.org>
 <CAMj1kXFTyc9KnMsnvs+mt80DbJL8VGKKcQ0J=4NrGYGSAG8sRw@mail.gmail.com>
 <20220202080401.GA9861@srcf.ucam.org> <Yfo/5gYgb9Sv24YB@kroah.com>
From: Nayna <nayna@linux.vnet.ibm.com>
In-Reply-To: <Yfo/5gYgb9Sv24YB@kroah.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vf-HhJE_J3Wv50M-mdF9pzQ8FOIkVc1V
X-Proofpoint-ORIG-GUID: sG9EJn0rsqG72creB7b1NZF5pzk4QyE3
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_07,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080136
X-Mailman-Approved-At: Wed, 09 Feb 2022 11:45:39 +1100
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Brijesh Singh <brijesh.singh@amd.com>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Lenny Szubowicz <lszubowi@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 gcwilson@linux.ibm.com, Ard Biesheuvel <ardb@kernel.org>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@suse.de>,
 "Serge E. Hallyn" <serge@hallyn.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, dougmill@linux.vnet.ibm.com,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, linux-coco@lists.linux.dev,
 gjoyce@ibm.com, Daniel Axtens <dja@axtens.net>,
 Dave Hansen <dave.hansen@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Andrew Scull <ascull@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------CciYVwa1O0LnsD73ZUULIc62
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/2/22 03:25, Greg KH wrote:
> On Wed, Feb 02, 2022 at 08:04:01AM +0000, Matthew Garrett wrote:
>> On Wed, Feb 02, 2022 at 08:22:03AM +0100, Ard Biesheuvel wrote:
>>> On Wed, 2 Feb 2022 at 08:10, Matthew Garrett<mjg59@srcf.ucam.org>  wrote:
>>>> Which other examples are you thinking of? I think this conversation may
>>>> have accidentally become conflated with a different prior one and now
>>>> we're talking at cross purposes.
>>> This came up a while ago during review of one of the earlier revisions
>>> of this patch set.
>>>
>>> https://lore.kernel.org/linux-efi/YRZuIIVIzMfgjtEl@google.com/
>>>
>>> which describes another two variations on the theme, for pKVM guests
>>> as well as Android bare metal.
>> Oh, I see! That makes much more sense - sorry, I wasn't Cc:ed on that,
>> so thought this was related to the efivars/Power secure boot. My
>> apologies, sorry for the noise. In that case, given the apparent
>> agreement between the patch owners that a consistent interface would
>> work for them, I think I agree with Greg that we should strive for that.
>> Given the described behaviour of the Google implementation, it feels
>> like the semantics in this implementation would be sufficient for them
>> as well, but having confirmation of that would be helpful.
>>
>> On the other hand, I also agree that a new filesystem for this is
>> overkill. I did that for efivarfs and I think the primary lesson from
>> that is that people who aren't familiar with the vfs shouldn't be
>> writing filesystems. Securityfs seems entirely reasonable, and it's
>> consistent with other cases where we expose firmware-provided data
>> that's security relevant.
>>
>> The only thing I personally struggle with here is whether "coco" is the
>> best name for it, and whether there are reasonable use cases that
>> wouldn't be directly related to confidential computing (eg, if the
>> firmware on a bare-metal platform had a mechanism for exposing secrets
>> to the OS based on some specific platform security state, it would seem
>> reasonable to expose it via this mechanism but it may not be what we'd
>> normally think of as Confidential Computing).
>>
>> But I'd also say that while we only have one implementation currently
>> sending patches, it's fine for the code to live in that implementation
>> and then be abstracted out once we have another.
> Well right now the Android code looks the cleanest and should be about
> ready to be merged into my tree.
>
> But I can almost guarantee that that interface is not what anyone else
> wants to use, so if you think somehow that everyone else is going to
> want to deal with a char device node and a simple mmap, with a DT
> description of the thing, hey, I'm all for it :)
>
> Seriously, people need to come up with something sane or this is going
> to be a total mess.
>
Thanks for adding us to this discussion.

If I have understood the discussion right, the key idea discussed here 
is to unify multiple different interfaces(this one, and [1]) exposing 
secrets for confidential computing usecase via securityfs.

And the suggestion is to see if the proposed pseries interface [2] can 
unify with the coco interface.

At high level, pseries interface is reading/writing/adding/deleting 
variables using the sysfs interface, but the underlying semantics and 
actual usecases are quite different.

The variables exposed via pseries proposed interface are:

* Variables owned by firmware as read-only.
* Variables owned by bootloader as read-only.
* Variables owned by OS and get updated as signed updates. These support 
both read/write.
* Variables owned by OS and get directly updated(unsigned) eg config 
information or some boot variables. These support both read/write.

It can be extended to support variables which contain secrets like 
symmetric keys, are owned by OS and stored in platform keystore.

Naming convention wise also, there are differences like pseries 
variables do not use GUIDs.

The initial patchset discusses secure boot usecase, but it would be 
extended for other usecases as well.

First, I feel the purpose itself is different here. If we still 
continue, I fear if we will get into similar situation as Matthew 
mentioned in context of efivars -

"the patches to add support for
manipulating the Power secure boot keys originally attempted to make it
look like efivars, but the underlying firmware semantics are
sufficiently different that even exposing the same kernel interface
wouldn't be a sufficient abstraction and userland would still need to
behave differently. Exposing an interface that looks consistent but
isn't is arguably worse for userland than exposing explicitly distinct
interfaces."

With that, I believe the scope of pseries interface is different and 
much broader than being discussed here. So, I wonder if it would be 
better to still keep pseries interface separate from this and have its 
own platform specific interface.

I would be happy to hear the ideas.

[1] https://lore.kernel.org/linux-efi/YRZuIIVIzMfgjtEl@google.com/

[2] https://lore.kernel.org/all/20220122005637.28199-1-nayna@linux.ibm.com/

Thanks & Regards,

      - Nayna

--------------CciYVwa1O0LnsD73ZUULIc62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/2/22 03:25, Greg KH wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Yfo%2F5gYgb9Sv24YB@kroah.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Feb 02, 2022 at 08:04:01AM +0000, Matthew Garrett wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Wed, Feb 02, 2022 at 08:22:03AM +0100, Ard Biesheuvel wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, 2 Feb 2022 at 08:10, Matthew Garrett <a class="moz-txt-link-rfc2396E" href="mailto:mjg59@srcf.ucam.org">&lt;mjg59@srcf.ucam.org&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Which other examples are you thinking of? I think this conversation may
have accidentally become conflated with a different prior one and now
we're talking at cross purposes.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
This came up a while ago during review of one of the earlier revisions
of this patch set.

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-efi/YRZuIIVIzMfgjtEl@google.com/">https://lore.kernel.org/linux-efi/YRZuIIVIzMfgjtEl@google.com/</a>

which describes another two variations on the theme, for pKVM guests
as well as Android bare metal.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Oh, I see! That makes much more sense - sorry, I wasn't Cc:ed on that, 
so thought this was related to the efivars/Power secure boot. My 
apologies, sorry for the noise. In that case, given the apparent 
agreement between the patch owners that a consistent interface would 
work for them, I think I agree with Greg that we should strive for that. 
Given the described behaviour of the Google implementation, it feels 
like the semantics in this implementation would be sufficient for them 
as well, but having confirmation of that would be helpful.

On the other hand, I also agree that a new filesystem for this is 
overkill. I did that for efivarfs and I think the primary lesson from 
that is that people who aren't familiar with the vfs shouldn't be 
writing filesystems. Securityfs seems entirely reasonable, and it's 
consistent with other cases where we expose firmware-provided data 
that's security relevant.

The only thing I personally struggle with here is whether "coco" is the 
best name for it, and whether there are reasonable use cases that 
wouldn't be directly related to confidential computing (eg, if the 
firmware on a bare-metal platform had a mechanism for exposing secrets 
to the OS based on some specific platform security state, it would seem 
reasonable to expose it via this mechanism but it may not be what we'd 
normally think of as Confidential Computing).

But I'd also say that while we only have one implementation currently 
sending patches, it's fine for the code to live in that implementation 
and then be abstracted out once we have another.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well right now the Android code looks the cleanest and should be about
ready to be merged into my tree.

But I can almost guarantee that that interface is not what anyone else
wants to use, so if you think somehow that everyone else is going to
want to deal with a char device node and a simple mmap, with a DT
description of the thing, hey, I'm all for it :)

Seriously, people need to come up with something sane or this is going
to be a total mess.

</pre>
    </blockquote>
    <p>Thanks for adding us to this discussion.<br>
    </p>
    <p>If I have understood the discussion right, the key idea discussed
      here is to unify multiple different interfaces(this one, and [1])
      exposing secrets for confidential computing usecase via
      securityfs.</p>
    <p>And the suggestion is to see if the proposed pseries interface
      [2] can unify with the coco interface.</p>
    <p>At high level, pseries interface is
      reading/writing/adding/deleting variables using the sysfs
      interface, but the underlying semantics and actual usecases are
      quite different.</p>
    <p>The variables exposed via pseries proposed interface are:</p>
    <p>* Variables owned by firmware as read-only.<br>
      * Variables owned by bootloader as read-only.<br>
      * Variables owned by OS and get updated as signed updates. These
      support both read/write.<br>
      * Variables owned by OS and get directly updated(unsigned) eg
      config information or some boot variables. These support both
      read/write.<br>
    </p>
    <p>It can be extended to support variables which contain secrets
      like symmetric keys, are owned by OS and stored in platform
      keystore.</p>
    <p>Naming convention wise also, there are differences like pseries
      variables do not use GUIDs.</p>
    <p>The initial patchset discusses secure boot usecase, but it would
      be extended for other usecases as well.<br>
    </p>
    <p>First, I feel the purpose itself is different here. If we still
      continue, I fear if we will get into similar situation as Matthew
      mentioned in context of efivars - <br>
    </p>
    <pre style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 51); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">"the patches to add support for 
manipulating the Power secure boot keys originally attempted to make it 
look like efivars, but the underlying firmware semantics are 
sufficiently different that even exposing the same kernel interface 
wouldn't be a sufficient abstraction and userland would still need to 
behave differently. Exposing an interface that looks consistent but 
isn't is arguably worse for userland than exposing explicitly distinct 
interfaces." </pre>
    <p>With that, I believe the scope of pseries interface is different
      and much broader than being discussed here. So, I wonder if it
      would be better to still keep pseries interface separate from this
      and have its own platform specific interface.<br>
    </p>
    <p>I would be happy to hear the ideas.<br>
    </p>
    <p>[1]
      <a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-efi/YRZuIIVIzMfgjtEl@google.com/">https://lore.kernel.org/linux-efi/YRZuIIVIzMfgjtEl@google.com/</a></p>
    <p>[2]
      <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20220122005637.28199-1-nayna@linux.ibm.com/">https://lore.kernel.org/all/20220122005637.28199-1-nayna@linux.ibm.com/</a><br>
    </p>
    <p>Thanks &amp; Regards,</p>
    <p>     - Nayna<br>
    </p>
  </body>
</html>
--------------CciYVwa1O0LnsD73ZUULIc62--


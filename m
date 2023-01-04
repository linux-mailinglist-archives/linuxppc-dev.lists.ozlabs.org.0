Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0899465CD0D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 07:26:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nn0476qnbz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 17:26:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OodNXdFA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=rajat.khandelwal@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OodNXdFA;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nmy5l2Dcgz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 15:57:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672808267; x=1704344267;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=29zEqvRT1blMmDseU70248TGyR+uvdbPoRwE3TZtIi4=;
  b=OodNXdFA1Skgc9dK2uSO+gWSEdM5r1ZVJ+CjupYkXYwfqQf+81isHq46
   XME5qvP1c+UjAhEUKAXUQ1qFiRwaE19ENC410pQUNyfFZWRgmW6aYehYe
   Bs3Q5nps0dszwz98zXrgpPSqB+eHLMscUtrBWu4D45ERH2Q9muDaenU21
   WSnniUyF89gyIW6WJ8orLpS/JGVc2dYm5KfVzX9Ei/O70LJr8wCBIm75q
   Gf+cVTfhZhQdL5Tc7qCY5b1wf/bXtIMtp1NdzN2haM7y3EY5Cc9bPUwwP
   14YkYywzVb6DYALCmZi3FGIkHgwsSxEFfoWKlH1LseDXSej5gTK/uj2fv
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301523435"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208,217";a="301523435"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 20:57:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="779082956"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208,217";a="779082956"
Received: from rajatkha-mobl.gar.corp.intel.com (HELO [10.215.202.196]) ([10.215.202.196])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 20:57:37 -0800
Content-Type: multipart/alternative;
 boundary="------------M6v4JDYwRG2rPcl7BnstEqYn"
Message-ID: <e6e53119-a249-a03f-c9eb-3caafbe5d983@linux.intel.com>
Date: Wed, 4 Jan 2023 10:27:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] PCI/AER: Rate limit the reporting of the correctable
 errors
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20230103191418.GA1011392@bhelgaas>
From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
In-Reply-To: <20230103191418.GA1011392@bhelgaas>
X-Mailman-Approved-At: Wed, 04 Jan 2023 17:25:44 +1100
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, "Neftin, Sasha" <sasha.neftin@intel.com>, Leon Romanovsky <leon@kernel.org>, linux-pci@vger.kernel.org, Frederick Zhang <frederick888@tsundere.moe>, rajat.khandelwal@intel.com, linux-kernel@vger.kernel.org, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------M6v4JDYwRG2rPcl7BnstEqYn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bjorn,

Thanks for the acknowledgement.

On 1/4/2023 12:44 AM, Bjorn Helgaas wrote:
> [+cc Paul, Sasha, Leon, Frederick]
>
> (Please cc folks who have commented on previous versions of your
> patch.)
>
> On Tue, Jan 03, 2023 at 10:25:48PM +0530, Rajat Khandelwal wrote:
>> There are many instances where correctable errors tend to inundate
>> the message buffer. We observe such instances during thunderbolt PCIe
>> tunneling.
>>
>> It's true that they are mitigated by the hardware and are non-fatal
>> but we shouldn't be spamming the logs with such correctable errors as it
>> confuses other kernel developers less familiar with PCI errors, support
>> staff, and users who happen to look at the logs, hence rate limit them.
> I want a better understanding of why we have so many errors before
> rate-limiting everybody.

--> So, we are debugging this inside Intel along with the thunderbolt/PCIe team. Apparently, it will
take some time to reach to a conclusion. Since I witness these errors in other thunderbolt devices
also, I am currently segregating all the TBT devices so that we have proper data to debug.

>
>> A typical example log inside an HP TBT4 dock:
>> [54912.661142] pcieport 0000:00:07.0: AER: Multiple Corrected error received: 0000:2b:00.0
>> [54912.661194] igc 0000:2b:00.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Transmitter ID)
>> [54912.661203] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001100/00002000
>> [54912.661211] igc 0000:2b:00.0:    [ 8] Rollover
>> [54912.661219] igc 0000:2b:00.0:    [12] Timeout
>> [54982.838760] pcieport 0000:00:07.0: AER: Corrected error received: 0000:2b:00.0
>> [54982.838798] igc 0000:2b:00.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Transmitter ID)
>> [54982.838808] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001000/00002000
>> [54982.838817] igc 0000:2b:00.0:    [12] Timeout
> Please remove the timestamps; they don't contribute to understanding
> the problem.

--> Sure.

>
>> This gets repeated continuously, thus inundating the buffer.
> Did you verify that we actually clear the Correctable Error Status
> register?

--> This patch targets only rate limiting the correctable errors since they are
non-fatal, and they kind of inundate the CPU logs, particularly during thunderbolt
connections. It doesn't have an impact anywhere else.
As per your suggestion in the igc patch, I found rate limiting as a doable option
currently. Have eradicated any kind of masking the bits.

>
> https://bugzilla.kernel.org/show_bug.cgi?id=216863  looks like a
> similar issue.  The issue Frederick is seeing happens when resuming
> from sleep.  Is there some event that triggers the correctable errors
> you see?

--> The signatures look similar but there is no such event which triggers these errors.
I witness them in many situations (hot plug, cold boot, warm boot, s0ix, etc.).
Further, I think the replay correctable errors arise in thunderbolt PCIe devices because
the timeout values are not adjusted properly concerning thunderbolt daisy chains.
Not sure, but since these PCIe devices work directly on the motherboard, and only give issues
when they are inside thunderbolt devices, I think the addition of PCIe bridges in the daisy chain
is not synced with proper timeout values.

>
> Bjorn
--------------M6v4JDYwRG2rPcl7BnstEqYn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Bjorn,</pre>
    <pre>Thanks for the acknowledgement.
</pre>
    <div class="moz-cite-prefix">On 1/4/2023 12:44 AM, Bjorn Helgaas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230103191418.GA1011392@bhelgaas">
      <pre class="moz-quote-pre" wrap="">[+cc Paul, Sasha, Leon, Frederick]

(Please cc folks who have commented on previous versions of your
patch.)

On Tue, Jan 03, 2023 at 10:25:48PM +0530, Rajat Khandelwal wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">There are many instances where correctable errors tend to inundate
the message buffer. We observe such instances during thunderbolt PCIe
tunneling.

It's true that they are mitigated by the hardware and are non-fatal
but we shouldn't be spamming the logs with such correctable errors as it
confuses other kernel developers less familiar with PCI errors, support
staff, and users who happen to look at the logs, hence rate limit them.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I want a better understanding of why we have so many errors before
rate-limiting everybody.</pre>
    </blockquote>
    <pre>--&gt; So, we are debugging this inside Intel along with the thunderbolt/PCIe team. Apparently, it will
take some time to reach to a conclusion. Since I witness these errors in other thunderbolt devices
also, I am currently segregating all the TBT devices so that we have proper data to debug.
</pre>
    <blockquote type="cite" cite="mid:20230103191418.GA1011392@bhelgaas">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">A typical example log inside an HP TBT4 dock:
[54912.661142] pcieport 0000:00:07.0: AER: Multiple Corrected error received: 0000:2b:00.0
[54912.661194] igc 0000:2b:00.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Transmitter ID)
[54912.661203] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001100/00002000
[54912.661211] igc 0000:2b:00.0:    [ 8] Rollover
[54912.661219] igc 0000:2b:00.0:    [12] Timeout
[54982.838760] pcieport 0000:00:07.0: AER: Corrected error received: 0000:2b:00.0
[54982.838798] igc 0000:2b:00.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Transmitter ID)
[54982.838808] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001000/00002000
[54982.838817] igc 0000:2b:00.0:    [12] Timeout
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please remove the timestamps; they don't contribute to understanding
the problem.</pre>
    </blockquote>
    <pre>--&gt; Sure. 
</pre>
    <blockquote type="cite" cite="mid:20230103191418.GA1011392@bhelgaas">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This gets repeated continuously, thus inundating the buffer.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Did you verify that we actually clear the Correctable Error Status
register?</pre>
    </blockquote>
    <pre>--&gt; This patch targets only rate limiting the correctable errors since they are
non-fatal, and they kind of inundate the CPU logs, particularly during thunderbolt
connections. It doesn't have an impact anywhere else.
As per your suggestion in the igc patch, I found rate limiting as a doable option
currently. Have eradicated any kind of masking the bits.
</pre>
    <blockquote type="cite" cite="mid:20230103191418.GA1011392@bhelgaas">
      <pre class="moz-quote-pre" wrap="">

<a class="moz-txt-link-freetext" href="https://bugzilla.kernel.org/show_bug.cgi?id=216863">https://bugzilla.kernel.org/show_bug.cgi?id=216863</a> looks like a
similar issue.  The issue Frederick is seeing happens when resuming
from sleep.  Is there some event that triggers the correctable errors
you see?</pre>
    </blockquote>
    <pre>--&gt; The signatures look similar but there is no such event which triggers these errors.
I witness them in many situations (hot plug, cold boot, warm boot, s0ix, etc.). 
Further, I think the replay correctable errors arise in thunderbolt PCIe devices because
the timeout values are not adjusted properly concerning thunderbolt daisy chains.
Not sure, but since these PCIe devices work directly on the motherboard, and only give issues
when they are inside thunderbolt devices, I think the addition of PCIe bridges in the daisy chain
is not synced with proper timeout values.
</pre>
    <blockquote type="cite" cite="mid:20230103191418.GA1011392@bhelgaas">
      <pre class="moz-quote-pre" wrap="">

Bjorn
</pre>
    </blockquote>
  </body>
</html>

--------------M6v4JDYwRG2rPcl7BnstEqYn--

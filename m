Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB365D80E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 17:11:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnF2p6HYfz3c9V
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 03:11:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tm6cX/3J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=rajat.khandelwal@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tm6cX/3J;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nn8vM4CWDz2xkG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 00:04:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672837471; x=1704373471;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=Cuw2NDDqGYLxk5B9sU2O0NBSrSW8/IdnNliLxvBQMyw=;
  b=Tm6cX/3JC1Rrl3udBzNbFfZPG4f8KCE0zzGJO7M8516a9TwyjpF5jX7T
   RaxLUkw8nrIpQenQbVxhUKfplDyUH3UX2Y7d4GvFA0yZr2fXkdACh5Eqm
   ioieYr9UHcYN+36d96t1FZDKsuV0UYiwOxSJaY0vQI6WheEFC7VSItTOI
   n0Q5x3lN/Sakx4Hx3oNSQGTm7vZsUfy0BbuEdS2tj6uhNDT+zcJAj2tOF
   L+eASuFK2e10PqWIUstedhysdQsYwhyh701NK5H2oyh0sWJ3vLf6WeHoF
   VfFaI0Npeo59NmN1G0DJ+3gWOQQnoNtSNYer1CHPpTGtwfkq53mTNxESM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="320639343"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208,217";a="320639343"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 05:04:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="797528903"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208,217";a="797528903"
Received: from rajatkha-mobl.gar.corp.intel.com (HELO [10.215.202.196]) ([10.215.202.196])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 05:04:22 -0800
Content-Type: multipart/alternative;
 boundary="------------iSDUHTti6E88vGV2l0Y8wL0E"
Message-ID: <94202834-6151-03ad-8891-d460a60e5e15@linux.intel.com>
Date: Wed, 4 Jan 2023 18:34:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] PCI/AER: Rate limit the reporting of the correctable
 errors
Content-Language: en-US
To: Leon Romanovsky <leon@kernel.org>
References: <20230103191418.GA1011392@bhelgaas>
 <e6e53119-a249-a03f-c9eb-3caafbe5d983@linux.intel.com>
 <Y7Ug3F6AIhaAiqCD@unreal>
From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
In-Reply-To: <Y7Ug3F6AIhaAiqCD@unreal>
X-Mailman-Approved-At: Thu, 05 Jan 2023 03:10:28 +1100
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, "Neftin, Sasha" <sasha.neftin@intel.com>, linux-pci@vger.kernel.org, Frederick Zhang <frederick888@tsundere.moe>, rajat.khandelwal@intel.com, linux-kernel@vger.kernel.org, oohall@gmail.com, bhelgaas@google.com, Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------iSDUHTti6E88vGV2l0Y8wL0E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leon,
Thanks for the ack.

On 1/4/2023 12:16 PM, Leon Romanovsky wrote:
> On Wed, Jan 04, 2023 at 10:27:33AM +0530, Rajat Khandelwal wrote:
>> Hi Bjorn,
>>
>> Thanks for the acknowledgement.
>>
>> On 1/4/2023 12:44 AM, Bjorn Helgaas wrote:
>>> [+cc Paul, Sasha, Leon, Frederick]
>>>
>>> (Please cc folks who have commented on previous versions of your
>>> patch.)
>>>
>>> On Tue, Jan 03, 2023 at 10:25:48PM +0530, Rajat Khandelwal wrote:
>>>> There are many instances where correctable errors tend to inundate
>>>> the message buffer. We observe such instances during thunderbolt PCIe
>>>> tunneling.
> <...>
>
>>>> [54982.838808] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001000/00002000
>>>> [54982.838817] igc 0000:2b:00.0:    [12] Timeout
>>> Please remove the timestamps; they don't contribute to understanding
>>> the problem.
>> --> Sure.
> Please don't add "-->" or any marker to replies. It breaks mail color
> scheme.
>
>>>> This gets repeated continuously, thus inundating the buffer.
>>> Did you verify that we actually clear the Correctable Error Status
>>> register?
>> --> This patch targets only rate limiting the correctable errors since they are
>> non-fatal, and they kind of inundate the CPU logs, particularly during thunderbolt
>> connections. It doesn't have an impact anywhere else.
>> As per your suggestion in the igc patch, I found rate limiting as a doable option
>> currently. Have eradicated any kind of masking the bits.
> You didn't answer on the asked question. "Did you verify that we actually clear
> the Correctable Error Status register?".

Yes, I have verified. The status is cleared successfully.

>
> Thanks
--------------iSDUHTti6E88vGV2l0Y8wL0E
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Leon,
Thanks for the ack.
</pre>
    <div class="moz-cite-prefix">On 1/4/2023 12:16 PM, Leon Romanovsky
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y7Ug3F6AIhaAiqCD@unreal">
      <pre class="moz-quote-pre" wrap="">On Wed, Jan 04, 2023 at 10:27:33AM +0530, Rajat Khandelwal wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Bjorn,

Thanks for the acknowledgement.

On 1/4/2023 12:44 AM, Bjorn Helgaas wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">[+cc Paul, Sasha, Leon, Frederick]

(Please cc folks who have commented on previous versions of your
patch.)

On Tue, Jan 03, 2023 at 10:25:48PM +0530, Rajat Khandelwal wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">There are many instances where correctable errors tend to inundate
the message buffer. We observe such instances during thunderbolt PCIe
tunneling.
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
&lt;...&gt;

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">[54982.838808] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001000/00002000
[54982.838817] igc 0000:2b:00.0:    [12] Timeout
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Please remove the timestamps; they don't contribute to understanding
the problem.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
--&gt; Sure.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please don't add "--&gt;" or any marker to replies. It breaks mail color
scheme.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">This gets repeated continuously, thus inundating the buffer.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Did you verify that we actually clear the Correctable Error Status
register?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
--&gt; This patch targets only rate limiting the correctable errors since they are
non-fatal, and they kind of inundate the CPU logs, particularly during thunderbolt
connections. It doesn't have an impact anywhere else.
As per your suggestion in the igc patch, I found rate limiting as a doable option
currently. Have eradicated any kind of masking the bits.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You didn't answer on the asked question. "Did you verify that we actually clear
the Correctable Error Status register?".</pre>
    </blockquote>
    <pre>Yes, I have verified. The status is cleared successfully.
</pre>
    <blockquote type="cite" cite="mid:Y7Ug3F6AIhaAiqCD@unreal">
      <pre class="moz-quote-pre" wrap="">

Thanks
</pre>
    </blockquote>
  </body>
</html>

--------------iSDUHTti6E88vGV2l0Y8wL0E--

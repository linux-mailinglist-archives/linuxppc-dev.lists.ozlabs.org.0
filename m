Return-Path: <linuxppc-dev+bounces-1675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE66988F21
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2024 14:16:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XG5sP3j5pz2xrC;
	Sat, 28 Sep 2024 22:16:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.50 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727525764;
	cv=pass; b=U+ZDaQxpOTw1F46WBxhpGydBGZ33B8R57mIhD48uUz496nrw/mT1hvAada5w7XtMD+joNEWCgGVBhNDW4StnRoOG3/IqZDgk02czlV0/FwvzrdBSMg+QNxkshf4xlzhCUdAGrh/6X7JVkxKttjhTv3jTWqHn9LetR5izmLvrA351SQQWTbnS/VmwMmPRs36vK3eKu+6reKJYyEc0DP0NiXs1WUPU6AXdMybB14hhLBREvhO/nqeyH/1HdqYIso4nh3t9UU8tva9wYmZv3JGye/MJ6kq4Ee6UR1Eil5Rj+jFxGZe4QPSgkzelb0ISh4Q54pty8EloruhxRTKW0Agj2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727525764; c=relaxed/relaxed;
	bh=4pDcPQ1hlnXeqnamK1kittvxmuAtTMn/1RxWbFUl+TQ=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:Cc:
	 References:In-Reply-To; b=FvmUpYYNIOMzkPjJ/WZy4HukunVjRIqhD8DObploP59JP/VI3D3YD+wom4tCVq1s/45KZ+cIHDhlKGLpzQdlwrn4W+NY1kEFn4ID30QlWinrGtJqG+sPONc0RmYVadaoNVETMY71VseV1B+6u1PpaXm0xWavVD3JAHeV19j+YWinpJhXxb8QhKbf+RLN80Z6ObzXSV8cAIULMFXCaSoPyeMjc3vKtU/nVIICVOkXq51Kt4nq5JemQNCICP2ymuSeX2EynvAmMvT6gV4dpcc4s0zbktQjZIGWkscg98s+N9zcyXxtTciPF3LGTvalKTMUt6vO8Q1yBoCZVt5Y/GraUg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=g1Wy1cbR; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=b6qMtv/b; dkim-atps=neutral; spf=pass (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=g1Wy1cbR;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=b6qMtv/b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XG5sF6hr1z2xnS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2024 22:16:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1727525754; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aGWjnXtxMDwUfSaNnNO7VnWjb2oyCEiJXFVHT9aSSG+d+c+67qatCZD59AQEPtuswo
    2crQekeZw3Ogsue9upqXjpI1rXYJYclklGJzmTKN7NPu34v0m2TKx00x4tbMA1O6v+IQ
    5TnfL2Mdg9leY98Q7oPIaqC/CUoB9Aiog+JBsi+XY1Lo7inv8StEgrzo0tWV5GkjQrNf
    hyw6v7lsEiQ2QmoqeyjJt+IW7CX8jmzr6UMlPFFtel7yw9a8+r0TwYMfTyXqL5mIbnwt
    umsPhsxYYSIQsTVBYtZW7VN5gfR3szgj0BH2+VNzlhAhcA174D4s8gkOqi4+qONPZ+El
    Trjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727525754;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=4pDcPQ1hlnXeqnamK1kittvxmuAtTMn/1RxWbFUl+TQ=;
    b=H1d4B3ShzR3AsKP9AfOfvknEs70bTQE17gjQWIHyB/7UKmRUfSrWNo+iEjCD3RN3rg
    kjvbGVyb2JX5VWuKV8jThtedAQ0e6ens4Bgznr9kitL8e/BYxwAV1AFofq8fEbNc8S8F
    fITrqHMayXnfp8p/kDLUSF1sWs8oBrRCHyYo/u6w32Q8kGHKkolKXX4TGTfy8WJIedH1
    CgbnyYnE0IxjwyA5/nHQOEDmhA+edlP+4TStaeQcTsh40y+uLdAwp3xJCA02isAKYIZW
    FmL9Dg8bPwTp1l7zM4Cq+RHbKxOy3oe7Wac7TmMedDvqqfYwpP8RPbfJTxOS9pE7OC9b
    dBPw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727525754;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=4pDcPQ1hlnXeqnamK1kittvxmuAtTMn/1RxWbFUl+TQ=;
    b=g1Wy1cbRHFGBfecY4U5AycWX2WL3AElF9pS7xbUuzVp3wo5uyY+e0Vt3cYSNj8QgsO
    bqSqf2nuBgWvMEahdkpQ19jU4RhXpPIaJWSaJ8+SOXlRm8SXLdB7ChN4lP/723VxLHu2
    KZCJq5XU0OG+q1FjkbqRIjmsxYr/i245Gaiyaoxloo3KdHx4Az6O7mDKkCR3hiG67qfR
    i3KYf1lo9Ia01NkOHoi654jkyQxUl+eoQDVqyZypB74D/pFVhBTkeHWk9sKzmGvb5l2a
    v/qtlpvSGvsNSaJuZfie2xFGw9B3Gp6XDGCEeAAp2vgjGV68ONQ9IUvmU9OawtGtr79G
    4djg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727525754;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=4pDcPQ1hlnXeqnamK1kittvxmuAtTMn/1RxWbFUl+TQ=;
    b=b6qMtv/bUduc5gJqvUm2TUHWvVgtbbAP7Hg8rjvPNF59rlaVrNd59mwYgEcAIGmQ5O
    MWLuI3HA+iplnTnly5Dg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr44+gKidpmhkOpz46lpM="
Received: from [192.168.178.134]
    by smtp.strato.de (RZmta 51.2.8 DYNA|AUTH)
    with ESMTPSA id e0da1a08SCFrNox
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 Sep 2024 14:15:53 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------VPPMkz5qjIhJpCcvk0hLe1aT"
Message-ID: <035efe6a-632d-4414-b63c-a3cb2c71ae4b@xenosoft.de>
Date: Sat, 28 Sep 2024 14:15:53 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FSL P5040 board doesn't boot after DRM updates
 (drm-next-2024-09-19)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <CADnq5_MM6UYOwFSPkZRauAyckFaUjCRGT97cVhsK=xZ9CzuXVw@mail.gmail.com>
 <20EA4BE5-B349-4406-89EA-3D442717EC03@xenosoft.de>
 <48f59b5b-b26e-49c5-9b58-1c877bea394d@xenosoft.de>
 <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu>
 <d10b0d41-8389-4b09-a531-c9c5d67df3b7@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <d10b0d41-8389-4b09-a531-c9c5d67df3b7@xenosoft.de>
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on boromir.ozlabs.org

This is a multi-part message in MIME format.
--------------VPPMkz5qjIhJpCcvk0hLe1aT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28 September 2024 at 01:46pm, Christian Zigotzky wrote:
> Am 28.09.24 um 10:42 schrieb Christophe Leroy:
>> Hi Christian,
>>
>> Le 28/09/2024 à 09:40, Christian Zigotzky a écrit :
>>> On 28 September 2024 at 09:21am, Christian Zigotzky wrote:
>>>  >
>>>  >> ﻿On Sun, Sep 22, 2024 at 12:28 AM Christian Zigotzky
>>>  >> <chzigotzky@xenosoft.de> wrote:
>>>  >>>
>>>  >>> Hi All,
>>>  >>>
>>>  >>> The lastest Git kernel doesn't boot anymore after the latest 
>>> DRM updates
>>>  >>> (drm-next-2024-09-19). [1]
>>>  >>>
>>>  >>> I tested it with an AMD Radeon HD 6970 (Cayman XT) and with an AMD
>>>  >>> Radeon HD 5870 (Cypress XT).
>>>  >>>
>>>  >>> I reverted the DRM updates and after that the kernel boots 
>>> without any
>>>  >>> problems.
>>>  >>>
>>>  >>> Please note: Due to a lack of time, I can't do a bisect.
>>>  >>>
>>>  >>> Please check the latest DRM updates.
>>> ------------
>>>  >>
>>>  >> Can you attach your dmesg output?  There was a regression in the 
>>> dma
>>>  >> subsystem what was fixed by this commit:
>>>  >>
>>>  >> commit b348b6d17fd1d5d89b86db602f02be
>>>  >> a54a754bd8
>>>  >> Author: Leon Romanovsky <leon@kernel.org>
>>>  >> Date:   Sun Sep 22 21:09:48 2024 +0300
>>>  >>
>>>  >>    dma-mapping: report unlimited DMA addressing in IOMMU DMA path
>>>  >>
>>>  >> Alex
>>>  >>
>>>
>>> ------------
>>> Hi Alex,
>>>
>>> I tested the latest Git kernel on my FSL P5040 board today and it 
>>> doesn't boot. Our FSL P5020 boards boot without any problems.
>>>
>>> I connected my FSL P5040 board with a serial cable to my PC for 
>>> getting error messages. Unfortunately there aren't any error 
>>> messages after the loading of the uImage.
>>>
>>> This means, that the dma-mapping patch doesn't solve the boot issue.
>>>
>>> Please check the latest DRM updates.
>>
>> Can you bisect the problem ?
>>
>> Christophe
> I would like ... but I don't have time for it. Sorry.

Hi All,

Sorry, I have forgotten to add the boot arguments "console=ttyS0,115200" 
for the connecting of my FSL P5040 board with a serial cable to my PC.

Now, I have a serial log file with Radeon error messages (kernel trace). :-)

Link: https://www.xenosoft.de/PuTTY_P5040_U-Boot.log

I hope, you have an idea. The FSL P5020 boards aren't affected.

Thanks,
Christian
--------------VPPMkz5qjIhJpCcvk0hLe1aT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 28 September 2024 at 01:46pm,
      Christian Zigotzky wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d10b0d41-8389-4b09-a531-c9c5d67df3b7@xenosoft.de">Am
      28.09.24 um 10:42 schrieb Christophe Leroy:
      <br>
      <blockquote type="cite">Hi Christian,
        <br>
        <br>
        Le 28/09/2024 à 09:40, Christian Zigotzky a écrit :
        <br>
        <blockquote type="cite">On 28 September 2024 at 09:21am,
          Christian Zigotzky wrote:
          <br>
           &gt;
          <br>
           &gt;&gt; ﻿On Sun, Sep 22, 2024 at 12:28 AM Christian Zigotzky
          <br>
           &gt;&gt; <a class="moz-txt-link-rfc2396E" href="mailto:chzigotzky@xenosoft.de">&lt;chzigotzky@xenosoft.de&gt;</a> wrote:
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; Hi All,
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; The lastest Git kernel doesn't boot anymore
          after the latest DRM updates
          <br>
           &gt;&gt;&gt; (drm-next-2024-09-19). [1]
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; I tested it with an AMD Radeon HD 6970 (Cayman
          XT) and with an AMD
          <br>
           &gt;&gt;&gt; Radeon HD 5870 (Cypress XT).
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; I reverted the DRM updates and after that the
          kernel boots without any
          <br>
           &gt;&gt;&gt; problems.
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; Please note: Due to a lack of time, I can't do a
          bisect.
          <br>
           &gt;&gt;&gt;
          <br>
           &gt;&gt;&gt; Please check the latest DRM updates.
          <br>
          ------------
          <br>
           &gt;&gt;
          <br>
           &gt;&gt; Can you attach your dmesg output?  There was a
          regression in the dma
          <br>
           &gt;&gt; subsystem what was fixed by this commit:
          <br>
           &gt;&gt;
          <br>
           &gt;&gt; commit b348b6d17fd1d5d89b86db602f02be
          <br>
           &gt;&gt; a54a754bd8
          <br>
           &gt;&gt; Author: Leon Romanovsky <a class="moz-txt-link-rfc2396E" href="mailto:leon@kernel.org">&lt;leon@kernel.org&gt;</a>
          <br>
           &gt;&gt; Date:   Sun Sep 22 21:09:48 2024 +0300
          <br>
           &gt;&gt;
          <br>
           &gt;&gt;    dma-mapping: report unlimited DMA addressing in
          IOMMU DMA path
          <br>
           &gt;&gt;
          <br>
           &gt;&gt; Alex
          <br>
           &gt;&gt;
          <br>
          <br>
          ------------
          <br>
          Hi Alex,
          <br>
          <br>
          I tested the latest Git kernel on my FSL P5040 board today and
          it doesn't boot. Our FSL P5020 boards boot without any
          problems.
          <br>
          <br>
          I connected my FSL P5040 board with a serial cable to my PC
          for getting error messages. Unfortunately there aren't any
          error messages after the loading of the uImage.
          <br>
          <br>
          This means, that the dma-mapping patch doesn't solve the boot
          issue.
          <br>
          <br>
          Please check the latest DRM updates.
          <br>
        </blockquote>
        <br>
        Can you bisect the problem ?
        <br>
        <br>
        Christophe
        <br>
      </blockquote>
      I would like ... but I don't have time for it. Sorry.
      <br>
    </blockquote>
    <br>
    Hi All,<br>
    <br>
    Sorry, I have forgotten to add the boot arguments "<span
      class="posthilit">console</span>=ttyS0,115200" for the connecting
    of my FSL P5040 board with a serial cable to my PC.<br>
    <br>
    Now, I have a serial log file with Radeon error messages (kernel
    trace). :-)<br>
    <br>
    Link: <a class="moz-txt-link-freetext" href="https://www.xenosoft.de/PuTTY_P5040_U-Boot.log">https://www.xenosoft.de/PuTTY_P5040_U-Boot.log</a><br>
    <br>
    I hope, you have an idea. The FSL P5020 boards aren't affected.<br>
    <br>
    Thanks,<br>
    Christian<br>
  </body>
</html>

--------------VPPMkz5qjIhJpCcvk0hLe1aT--


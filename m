Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3CF2E9C4E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 18:45:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8jhb3lM1zDqQq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 04:45:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.182;
 helo=mail-pg1-f182.google.com; envelope-from=bart.vanassche@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8jfm0VSVzDqND
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 04:43:53 +1100 (AEDT)
Received: by mail-pg1-f182.google.com with SMTP id i7so19501181pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jan 2021 09:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W41s4SpHuFxfP2VmE7HCI4KFVMEE3WKx0iXTMwP7vnM=;
 b=RbD84B/VnUth1kBa31gH8TE30uzAOL6jvp7IVEfBBrorkS5QQ72EVtpSYZtQneULZy
 SZp1HprWiNJZSvij8jsaAoCGQkL07yPhEAwQyeRO1cxn9hOPBbjuATf3/OTS0PkLGfGp
 jmshb8etFu2mNewXa7ko20MAkiebIkPQpKziE6wp2SuDUfyRvFSLX3DBoSc/vZddGXJp
 hhtw4Wf/9WIVW1TY+Uiy9aC0WHFTHQQhTItLxhFxsaeFlfuqsQTlWYlXOtNAopsTTTev
 IFLfx+PzBu99bWg4OBcnZkcJ9OQucWoxj90PckYboXxo1iq0ezUGBGdhaYOHKY7UBDs8
 WGXQ==
X-Gm-Message-State: AOAM531H0lNioTH95QLXZJXDDo29KQasZOmydaRKBgK9I+L/p6GnIbAX
 MfLPiSYofSe1u9tb90ct96U=
X-Google-Smtp-Source: ABdhPJwKTIkHd9jD106iNYsMCjlbG9ke8DsYiuUgJzn38bv0xFujzmC1vyllUPjkZAgfvXQ07hPHdg==
X-Received: by 2002:a63:c1e:: with SMTP id b30mr71096758pgl.72.1609782229216; 
 Mon, 04 Jan 2021 09:43:49 -0800 (PST)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id b4sm10376pju.33.2021.01.04.09.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 09:43:48 -0800 (PST)
Subject: Re: [PATCH] scsi: target/sbp: remove firewire SBP target driver
To: Finn Thain <fthain@telegraphics.com.au>
References: <01020172acd3d10f-3964f076-a820-43fc-9494-3f3946e9b7b5-000000@eu-west-1.amazonses.com>
 <alpine.LNX.2.22.394.2006140934520.15@nippy.intranet>
 <7ad14946-5c25-fc49-1e48-72d37a607832@boo.tc>
 <alpine.LNX.2.22.394.2006150919110.8@nippy.intranet>
 <8da0c285-d707-a3d2-063e-472af5cc560f@boo.tc>
 <alpine.LNX.2.22.394.2006161929380.8@nippy.intranet>
 <8cbab988-fba7-8e27-7faf-9f7aa36ca235@acm.org>
 <alpine.LNX.2.22.394.2006171104540.11@nippy.intranet>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <e3b5ce6a-0152-01b8-89d2-80bcdb9c1c57@acm.org>
Date: Mon, 4 Jan 2021 09:43:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.22.394.2006171104540.11@nippy.intranet>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Bellinger <nab@linux-iscsi.org>,
 target-devel@vger.kernel.org, Chris Boot <bootc@boo.tc>,
 linux1394-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/16/20 7:07 PM, Finn Thain wrote:
> On Tue, 16 Jun 2020, Bart Van Assche wrote:
>> As far as I know the sbp driver only has had one user ever and that user 
>> is no longer user the sbp driver.
> 
> So, you estimate the userbase at zero. Can you give a confidence level? 
> Actual measurement is hard because when end users encounter breakage, they 
> look for quick workarounds before they undertake post mortem, log 
> collection, bug reporting, mailing list discussions, analysis etc.

(replying to an e-mail from six months ago)

Hi Finn,

I am confident that my estimate is an accurate estimate since I have not
seen any sbp support requests, sbp bug reports nor any sbp bug fixes since
the sbp target driver has been accepted upstream.

> Here's a different question: "Why remove it from the kernel tree?"
> 
> If maintaining this code is a burden, is it not the kind of tax that all 
> developers/users pay to all developers/users? Does this driver impose an 
> unreasonably high burden for some reason?

Yes. If anyone wants to change the interface between SCSI target core and
SCSI target drivers, all target drivers, including the sbp and FCoE target
driver have to be retested. In other words, keeping unused target drivers
inside the kernel tree involves a significant maintenance burden for anyone
who wants to modify the interface between the SCSI target core and SCSI
target drivers.

Additionally, there is a good alternative available for the sbp driver.
Every system I know of that is equipped with a Firewire port also has an
Ethernet port. So users who want to provide SCSI target functionality on
such systems can use any SCSI transport protocol that is compatible with
Ethernet (iSCSI, iSER over soft-RoCE, SRP over soft-RoCE, ...).

Thanks,

Bart.

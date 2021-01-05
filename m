Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 912E42EA300
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 02:49:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8wR51VgyzDqXQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 12:49:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.178;
 helo=mail-pg1-f178.google.com; envelope-from=bart.vanassche@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8wPS57GLzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 12:48:12 +1100 (AEDT)
Received: by mail-pg1-f178.google.com with SMTP id 15so20265686pgx.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jan 2021 17:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iUVK5navqb95pupmgd9YzX87VeG3u/6V7I7N2PejYtg=;
 b=k/QKbByjjAqoW4BI7yRcR6ZOqAh10U9ILkVNeIoq63OFZMrGfYQiqYt+IIoz8p2YDN
 tH6fRW+spQ56xWsmkb4gzYWErwuJ3jmbHUBU34dt1zyj1Rz7uOhtj/mSh0lolXdWKh0g
 +8984aNIij91EDwc2Tk/ktOpDIE8Xgj1kkk7N7T1rtDRZZE9GEnfH8chT8BIn75B5YTy
 ppYWMM7eSkchIwKf+fryugg6EvzuJjoe+GibwuStyg58OHjyxrfg0fUHUbVbQsVixL4p
 dBvW9XQw7gnxUsbcu9mDH84R+i2CcymGriclWyD/x3p8xEntMeLwmBL4rvqqpSX7xfQf
 Yk9Q==
X-Gm-Message-State: AOAM533IjLE5No3HQ9DUZ/Vgkq6KPPk1gOXO8wHqqrWU/Zc2tHTOqBR0
 DtoCbr+zc94CMyNb3hz8FQo=
X-Google-Smtp-Source: ABdhPJwzgRX+RGhlnQaIjfArrJuHlMKAMOxe4eTbuOyxNFW7vMhZmvmjR2h5swJDzjjpRU13PM4MEw==
X-Received: by 2002:a63:5d7:: with SMTP id 206mr75322598pgf.384.1609811289105; 
 Mon, 04 Jan 2021 17:48:09 -0800 (PST)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id i7sm56827951pfc.50.2021.01.04.17.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 17:48:08 -0800 (PST)
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
 <e3b5ce6a-0152-01b8-89d2-80bcdb9c1c57@acm.org>
 <alpine.LNX.2.23.453.2101050840010.6@nippy.intranet>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <9103b316-8848-2350-7c0d-b742c8d8c83c@acm.org>
Date: Mon, 4 Jan 2021 17:48:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.23.453.2101050840010.6@nippy.intranet>
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

On 1/4/21 2:50 PM, Finn Thain wrote:
> On Mon, 4 Jan 2021, Bart Van Assche wrote:
>> Additionally, there is a good alternative available for the sbp driver. 
>> Every system I know of that is equipped with a Firewire port also has an 
>> Ethernet port. So users who want to provide SCSI target functionality on 
>> such systems can use any SCSI transport protocol that is compatible with 
>> Ethernet (iSCSI, iSER over soft-RoCE, SRP over soft-RoCE, ...).
> 
> Ethernet is not always an alternative. That was already discussed in this 
> thread. But let's assume for a moment that you can migrate any and all 
> users of this driver over to an ethernet driver.
> 
> Why would the maintainers of that Ethernet driver and its API accept that 
> plan, if adding users would extend their maintenance and testing 
> obligations? Do you think those maintainers should pay the "kind of tax 
> that all developers/users pay to all developers/users?"

Hi Finn,

I cannot speak in the name of the iSCSI over TCP/IP or iSER driver
maintainers. But since I maintain the SRP initiator and target kernel
drivers myself, I can state that I would be happy to help SBP target users
(if that driver has any users today) to switch from SCSI over Firewire to
SCSI over SRP over RoCE or even NVMEoF over TCP.

Thanks,

Bart.

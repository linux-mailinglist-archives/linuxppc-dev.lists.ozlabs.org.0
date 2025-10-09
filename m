Return-Path: <linuxppc-dev+bounces-12727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B41BC7642
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 06:55:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chyH65GZwz2yrP;
	Thu,  9 Oct 2025 15:55:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.52 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759985714;
	cv=pass; b=KQ7DZXWq2ISnyTVajKg2nkA7jGr8fmaeMqBgPSMKGExhkPanLuZ2q6r9gKdTs+6MnMLraOR6MQYs2EYDEsFfeW7bQMQeK8up7dBrlgOVdKhcfSj1UIJk4GCHqW6qiyYGIDV1T3RBDDEil0Q5Vfg9GzX+FpEMsAInQxL2bOvuO5qjG6icnClUfHcK/0zn3YnGJ9XaxAIWj+eBO7/7cvIceJGsqQBE4pFl+Dy+TeWVNirCPRVThIuOACwa322NMmHWyVGtQZhyqo9mRndGsDo4OlL4XTvPDwepXj6l9Ls1DJkFbARs6ogjCFNW8mizFTr36DpAvAPsLfyC72rfIRzozg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759985714; c=relaxed/relaxed;
	bh=OX1tVNlrAcfa4iqVVPoLKKR8g4n/Am+5WfbaAXlKtTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dMMiKVgrCQZRkK5rqRllgryhun/darHaarOauSnoOrbZe70eON2NNPiUYlfDun8dUCl3fVd0joeIHr/I7CuUuHH7mD+p/sCLsJ9YDUtp/vU9sIuBf3KkmZYjjK33aPXTbuZiU0lhm9Ddv4FIiTJJzlT/WnG7VH1BGw8VGLKz6WLhRx+1uWgZU6Gril6B4JlbmLHKT/DpT7xiiMq0c6jEHqNUdJV3bsndjw6VsDPB8W/N30BckMTeBvKJo/Tbaxrhxo6dtqb2ZFLMq5iEOeL9xlwjjhLSI+ndfcSGAf3DdE/n5oKh2rZhoDDtUHmwCN7C98QkntpPRW7rp25aGoUmLA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=qbij8MxK; dkim-atps=neutral; spf=pass (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=qbij8MxK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chyH35g8sz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 15:55:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1759985700; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=F56rCJ0q8954aZD94VJ7x27yd9u9Aj40qJVUQCOJOrn7NN79qIABhRLPUqiN/YA2l+
    00xiMNy2+y0/dEzseMe3h88j83UNm4CnM2ue4OLfJUjDto2neav8MyW6fym3KLKHLuLT
    3eODsQoMpDAQlTis3rr18EsSbFAPrMDEAbARDBVYufNf2R47OZN5pmFKwEiKzhIWL7rS
    YRFYx/nij/migaYjPs/k0lsKks67bbLsoGCeoVK+6igceW/o7PFY83CSdUmorkaevtR3
    wo57x6I6Ifr/IJhqG1Oc0951qWARrKxjUe4Os8RPfqbiILzcJBBLbOwTXgBygTxE8tgq
    r+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1759985700;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=OX1tVNlrAcfa4iqVVPoLKKR8g4n/Am+5WfbaAXlKtTo=;
    b=swjNYCScNauh8GrYI/0/v2O9RPZ69vuX4M7qXdEpldyXGw0znTXajzCtPA7FZNrHUp
    yMKGAdxMtEzmEZ0Mou0hOmP/tBaCoWKd2hJQE3B/rckuhD8+HeNA4gAIgSkqgnOtYOIl
    YoiIFvmtSTEAw9knOqrS6bg2Fjygnb4GgvuOH0Hfjj/zal/4WBGOemat5mjEbNzLD2Pf
    IT0fosnoAcF5rdBrIm7+Ru6Xp175iC+MTzGvwd6IAwA86kTIYSf8PGnmJzcnlwAGIHpL
    UEFUjjOVk1hh+rY0fww/GKTMLdSYmQAFQpdGu8Kwkl8sPoljAR7QGCFr0uwg7i6AEkM4
    dQ0g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1759985700;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=OX1tVNlrAcfa4iqVVPoLKKR8g4n/Am+5WfbaAXlKtTo=;
    b=qbij8MxKVR9tfg+gp5RzyF7cOdefyYKfKaqcsVEY5eK5cPXulA07H5Wj2ptFcfGU5p
    ADDMfjTJ7ng8340D4Ur9tZmB4MQVpw9dQ32wM3VvtX/4g6ggHTQ7RbxjpzFI39n/0ncs
    976yKUbBZNR7je1lCfY7LYAdTUG7ItEwRs0zMfM0EFZbJtEdNRYIWdwNcyDh4mckArjC
    ZjArxHVoDbl5jPZTItixFFV5jV2syfYfYP0RKvzBra0obS3E1rgiKLZfB7yO19ni+Snl
    QDkBXjf6TibuU+k5kVf1kLkdIgtDfwrefJmrudoolfBBKR2UNvo3fiC5GziH8S2NOjWW
    fsVA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+l6hjg"
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e288661994sx35X
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 9 Oct 2025 06:54:59 +0200 (CEST)
Message-ID: <bf9ca58b-b54a-42fc-99f7-4edaa7e561f3@xenosoft.de>
Date: Thu, 9 Oct 2025 06:54:58 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>
References: <20251008195136.GA634732@bhelgaas>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <20251008195136.GA634732@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 08 October 2025 at 09:51 pm, Bjorn Helgaas wrote:
> On Wed, Oct 08, 2025 at 06:35:42PM +0200, Christian Zigotzky wrote:
>> Hello,
>>
>> Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]
>>
>> Without the pci-v6.18-changes, the PPC boards boot without any problems.
>>
>> Boot log with error messages: https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_changes.log
>>
>> Further information: https://github.com/chzigotzky/kernels/issues/17
>>
>> Please check the pci-v6.18-changes. [2]
> Thanks for the report, and sorry for the breakage.
>
> Do you happen to have a similar log from a recent working kernel,
> e.g., v6.17, that we could compare with?
>
>> [1]
>> - https://wiki.amiga.org/index.php/X5000
>> - https://en.wikipedia.org/wiki/AmigaOne_X1000
>>
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f2c7254931f41b5736e3ba12aaa9ac1bbeeeb92
> #regzbot introduced: 2f2c7254931f ("Merge tag 'pci-v6.18-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci")
> #regzbot link: https://github.com/chzigotzky/kernels/issues/17
Thanks for your answer. Here is a similar log from the kernel 6.17.0: 
https://github.com/user-attachments/files/22789946/Kernel_6.17.0_Cyrus_Plus_board_P5040.log 



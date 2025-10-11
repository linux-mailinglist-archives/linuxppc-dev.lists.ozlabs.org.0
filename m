Return-Path: <linuxppc-dev+bounces-12774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9A5BCEFE7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Oct 2025 07:13:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ckBZr0TrBz2yr9;
	Sat, 11 Oct 2025 16:13:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.167 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760159587;
	cv=pass; b=Gv3IM7E5+jenaTe+qnaa4ReaBjwsuZI3glTfKb+4N2RhCQyGQAzFIRgoSJ3E81IOzlbTVeuAMBeT09Ge+3PbzUwEl4Q4QsdGcKQVu536yQypYHam2SYeSo7KM4sBaAHn2tVG8Uj2JrI7Gzv5kNnOz7lnUtNZydd7Ta/9vrSlz68W/wBsFf754yXfKXPdTOdWflPBmpjs3QMTjLnxnJx0xyrMfzn+nuu3D1Fdco5XZVp/A+su60CN2vexQGg4OavBCzfim/Qij7UnaN67DgdeI+h6Wa8JWPEYYRKjFhzRU73K4duy0zyunQ6fyD+1K2X4W9l4usztPVayIT6EaWM91w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760159587; c=relaxed/relaxed;
	bh=CueFFfpjBu04D7vogLYnYo/zMgNC5D9Pphjzbi9BwDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtIxKlOBCjn77q4WeWeo3RV/rgdtHvbBfcJnX6quY+ivooHXzCCMEvhOoiEJAL3qRtB0w++vi7C3hort3n3iQ6InuoqLjOFkcSXGmleL7m+/RilRD9VW/zLc4RnHnj8aUVxS+2nILB1MuIhulGqgSZZwiR4uA5Tv+4fD3Vu8eY69Vy4fEQLBEUO+GNXtdZIbMnuR2XT0H344mJso8xenGzoanS5RIUmPVPoad1pfIiQSaMKKCqBpNaW16NXLgH3N1YjDPNfHLnZspxUzKqhkii3PlEyDQdrjkouzm0GVA3+ON89c0X8vBuFbUADjFhGZSXBwEAUeHdRDyNnYJ3L8ig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UUBQXvQ0; dkim-atps=neutral; spf=pass (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UUBQXvQ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ckBZn3cRkz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Oct 2025 16:13:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760159571; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=srL6GbwiSbtfBsVLH6+FUznb4pLOsjS9BGjx0pnXH8TGQSxUvxiSid4irc/WHu1oPB
    ibEMsfDkfUvnZU7q4one+1Em14UErIKbEre//1uqRcfK/q9ruq/+7dMUzBNXG9+1fFgk
    L0cRbM9YHsM2u0hn6Sbb/fBmztaq7MOSDmKpj6bgvkw5NOJUsc6tEMezFt/nz/zR1fal
    NC9Z0yLf2Mj9FR0MCqW3GuI2ejdWx8VEPSucnK3iluwseGxoJ/F+LcCdtmidbq/8QU28
    jJKoyWGR1GtYqWYDTAHSUEZtl6IQibYmZWlGA7FpUTWH5zpuJQWbI997+ZGO5zUz1p8Y
    6DYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760159571;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=CueFFfpjBu04D7vogLYnYo/zMgNC5D9Pphjzbi9BwDM=;
    b=B1/khlUp2xmbKQ/9IKs01S9SqW0qXmB3Rlw9q/JRw3l//ABF94S5Rdb6R/pVm5gE5x
    gvNfsBoSRmhA7lvO9ptY2SM4Q3OoTXUqjjBRsfWzgG1OsT5fCaQl1zQQSblHCFmtyplj
    d+FEUWXqFq3iecVoi0i3aYlqEFgKsF8txe8sTkPmxRHs2rkNl8Yp18qVaYor8vYgUt0Z
    0coK3yzbPlShfpIfWmBp8u7LV6Xez53RNIiYRwrJVv0u17XYIo0xNWdtynSwT4F1claR
    zyr1mf1qIc6R8QEjga20BCUhpFIpKub/OfVXq8u9uQ4c4wsuk6Jza2X9+hAWB9yMzmh6
    QqXw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760159571;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=CueFFfpjBu04D7vogLYnYo/zMgNC5D9Pphjzbi9BwDM=;
    b=UUBQXvQ0D4Ng8LDUz0wLNHYgs2KTNSf9sa6TK5t33K7Ch9FUK76hem+T1fAVG4Besu
    6b6qk4XsvRdZLtrSr2WBYk4UycU8fYV7SNLI2tvGmL9W9D7YmW6KLrQtu57CQNAysKUC
    REDWiAmuxM2h7GuMjJB8rCgXtQPOPm9KByRI2/Oh/yPxbD8ztO3k5oCURSRLDbX/KnIF
    rRc+95dNqrRbZcJy8bEy0oq4+GM5MnEggmX5UXaQhuOykqd186YHDZE9uIYYalWvrgh2
    N4mwGFE0hpmDlt/8JSRcGUlp9GaVkseIJ7OxEjwxxl4fRfrcVRaW9wakm6sDunNoHF3X
    SOdA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+l6RLg"
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e2886619B5CoDjB
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Oct 2025 07:12:50 +0200 (CEST)
Message-ID: <d89576ac-c34c-4832-b51b-cf6f60c5c85c@xenosoft.de>
Date: Sat, 11 Oct 2025 07:12:49 +0200
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
To: Lukas Wunner <lukas@wunner.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>
References: <20251008195136.GA634732@bhelgaas>
 <bf9ca58b-b54a-42fc-99f7-4edaa7e561f3@xenosoft.de>
 <aOdKAp8P0WwVfjbv@wunner.de>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <aOdKAp8P0WwVfjbv@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09 October 2025 at 07:37 am, Lukas Wunner wrote:
> On Thu, Oct 09, 2025 at 06:54:58AM +0200, Christian Zigotzky wrote:
>> On 08 October 2025 at 09:51 pm, Bjorn Helgaas wrote:
>>> On Wed, Oct 08, 2025 at 06:35:42PM +0200, Christian Zigotzky wrote:
>>>> Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]
>>>>
>>>> Without the pci-v6.18-changes, the PPC boards boot without any problems.
>>>>
>>>> Boot log with error messages:
>>>> https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_changes.log
>>>>
>>>> Further information: https://github.com/chzigotzky/kernels/issues/17
>>> Do you happen to have a similar log from a recent working kernel,
>>> e.g., v6.17, that we could compare with?
>> Thanks for your answer. Here is a similar log from the kernel 6.17.0:
>> https://github.com/user-attachments/files/22789946/Kernel_6.17.0_Cyrus_Plus_board_P5040.log
> These lines are added in v6.18:
>
>    pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
>    pci 0000:01:00.0: ASPM: DT platform, enabling ClockPM
>    pci 0001:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
>    pci 0001:01:00.0: ASPM: DT platform, enabling ClockPM
>    pci 0001:03:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
>    pci 0001:03:00.0: ASPM: DT platform, enabling ClockPM
>
> Possible candidate:
>
> f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
>
> ...
>
> Thanks,
>
> Lukas
Hello Lukas,

After reverting the commit f3ac2ff14834, the kernel boots without any 
problems.

f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for 
devicetree platforms") is the bad commit.

Thanks,

Christian




Return-Path: <linuxppc-dev+bounces-13347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDCFC0F8E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 18:13:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwKp93bh0z2yjs;
	Tue, 28 Oct 2025 04:13:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.166 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761585185;
	cv=pass; b=g7A8jyNtSYS6AV5c8sKIIs45Db5AN7x+0qTzaP6tneC/CecmuOPkvACxaMZEsYXz9pyj3iGpjISuglBreQWlyMj9P5n893VhvPyvMg1/N8fla6DfH1cByQ5aBsvx5/vbCKBcYnzaLtODBnoQgPAEcv9pCaPc6EZDlX+cmD3YzVGL4a1ztF2Dw2UdOw1x+k8bWnOWfRwcVugfwGjMPm/FjPygHtZ4oc0QNP/voBdlBdPMjKLlJIai8TW++x5vrTNCcZx98BYOCUqDTq6SB/5sHy9Dz7Ej6ACwHcP0JtBs9HHAPk6+UF5gqP3qAOAM7Zwcz3CIvchg6tl/zCzEFHV2og==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761585185; c=relaxed/relaxed;
	bh=13Eh27o4UqsOQ34xi8S2wPYjOon2zusfqlo4MpiYA2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuAu3/RO8MHsp83TajFKATQGosEytWi9avl7OipTCBoUEQgtvtve0fPZ6TDdWFqOsgyjN+rxZ1zImZ++dGaZb7tFcOJ/mbJ0TFgZfG/mcPHUOW+NOD2imPjIfrbrRqxpEm5lI0Ly95Vlrw0u7Jq+pJL2Kkl74TgyRtjvVGc/4KEZvaZ7fvcEG/RLTHiSU9c8amtlBjaJakG8L7ooVABLWaoH2kdYiPo/r8xD6UwWjUZJYKt+X+iKSnRvKUx1Bt3A48BKT6ZlKplmCvIOpmhLfCY7VAuMqNftg943ZCOyjqoaQfnrG3DGM2IM9JOre7RkD0kG8KqRHAdKkEWN9fXq8w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SL0hpBWp; dkim-atps=neutral; spf=pass (client-ip=81.169.146.166; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SL0hpBWp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.166; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwKp66LFJz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 04:13:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1761585147; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=iSFk4OiuvL8e8Pzfi5fiJdD+jKLneJKnfcb8lL0E4JI+uUuy1Dc59tRlf7grT56CJT
    hlPyr8x6uZ9wvbSOB80yDuVVNpWPf4RkOI4kEHnhoidJqSTf6lcfnpf2ukt+tGQxLoYD
    jeZHGQAPVFmGHiRKMmDsblVWgAJyx7vw4VSzqeR/pQRqrn7uYmmbftwgSFZrdv8iWXVC
    q9iagLSBh/HqG87tvPHzK1HxVjARZXcw2DcBJRUVGEqqsMv5neueDvzNNjkuNxU9uQDK
    nLmu46nl0yqeqNQ2r84soFghuhnQVwfpksSAIrk3BdwpuS+oSO4KhL47VjNfkgFYLOcZ
    W65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1761585147;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=13Eh27o4UqsOQ34xi8S2wPYjOon2zusfqlo4MpiYA2k=;
    b=cc/uHztL9qfmFGxvFRvXRx9jH9UoYtEnUjx4QioYc9Nt13EoyGJqXMHwJhZW/c/JBy
    X7ZHV8VNKQOezLsU6FCNK3UwxfL2RYp78dhXRQM4/hYjbZ+JyEQoqN721lE0Y0ZAG8rn
    93yzMW8gXVidoAQpQ03pbFb94doSwTvzsKT+lmBSa7jdOFJrAAMliXK58sJ4BlL7yLxS
    B2jXtAnT37s5BV0a8Rq+F5K4CavuJubSleN7dQC/3g33mRoSfFLweLgrAiCC9mH/FZTj
    Dz2CY4Xdpd4qVm8kDuOxT20SSQJjDWApdzGH5m/o+6JwVR3tx6C/x8A1PG6SQDeeHJej
    hrOA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1761585147;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=13Eh27o4UqsOQ34xi8S2wPYjOon2zusfqlo4MpiYA2k=;
    b=SL0hpBWp9K5XPn08SzhMWLoaM3HAMUicwwKckYD30tB43wSmf3e8dn4uXATn4kLlPh
    RZFVde1tdkEbWD+9/aFM65RhN1Oqlqj05eOTEj9gSBl/M98fgVd+6XZsb0Zt1ThPhoCQ
    GUh74HjFHdCj0MPQH9fmMCbFi4+qh+dWi/rzHqyXWIlf++BrJwg7nn0b+X6/cvMo865i
    IrQAEjPI50xpcmTl6TnDQTjpmFXwN9hw0JZ7DwMombbaCRVOjr0+IL53zlOMl2dD7XRw
    uFWbnY0UPYH0sfXJE1+4QJ6bxd7tlG2hHGjlQL9JBnyyEtbYDgBh9tMmJyoaqnKLVawI
    Y7VQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIy+l7Rng"
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e2886619RHCPBv7
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 27 Oct 2025 18:12:25 +0100 (CET)
Message-ID: <3aa95b26-7801-476e-840f-5976b0ee11c1@xenosoft.de>
Date: Mon, 27 Oct 2025 18:12:24 +0100
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
Subject: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
To: Bjorn Helgaas <helgaas@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-pci@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 FUKAUMI Naoki <naoki@radxa.com>, Herve Codina <herve.codina@bootlin.com>,
 Diederik de Haas <diederik@cknow-tech.com>, Dragan Simic
 <dsimic@manjaro.org>, linuxppc-dev@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Frank Li <Frank.li@nxp.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au
References: <20251024203924.GA1361677@bhelgaas>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <20251024203924.GA1361677@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi All,

I activated CONFIG_PCIEASPM and CONFIG_PCIEASPM_DEFAULT again for the 
RC3 of kernel 6.18. Unfortunately my AMD Radeon HD6870 doesn't work with 
the latest patches.

But that doesn't matter because we disable the above kernel options by 
default. We don't need power management for PCI Express because of boot 
issues and performance issues.

Cheers,
Christian


Return-Path: <linuxppc-dev+bounces-11509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DF4B3C5C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 01:58:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDFbC2lGsz2yPd;
	Sat, 30 Aug 2025 09:58:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756511911;
	cv=none; b=eAqhTLhREnMJQEQNGL/EiFtDjDd9HD99q9CxuLCM/+Sz+mpoUoY2hiUAi2+pRDI9Lt1er02asQsHJsc/5tcWMM1sgL1G97X/apGQ1B4PDNUUkwyO0NfPA9wn13alI1FWjDcQqD8+T5s6BZXoQ5KbsVW4vaWhgbMP49cdQk2KFZmOj5lEkl1FYC5S0kPA0q1IvaYtd6yVVI0gYDNMXvJI2lJeIqk4NpbNLTwc9XzDQtM5nlyvCzc+Ka3odSPe8CMPdGwAKh4aTJu+BuZVYoIhnx0/oCyImEXcT/SWXyEGsibLVp6Jr0lQV0b8nWW3ZZJ9hvkynvblwBPrjdYem7/sPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756511911; c=relaxed/relaxed;
	bh=4ZkOb/hPcVe8gnDPdefZkpPuz6ZACFjeMAIL1vSEcE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtNTqK7bZclia7CMinmDSKfw6q0zmX/zd+KI3ic1c4jU+lkr8Z7byl8ENp52s2lWkEBxj4P2yVm0+wm+idQhM4i1FXs6O+WoYcAX9Y5zqiteg1eerVMPtMJyFMOykF2titA7PiJfFUClv+kuuKbpkAcVZvQbUykUlpa+IkXrM3ElGotVqPW+FGyTA6DVyZy9JSCI0FGEEAQnC6TNyKmpEjJQiGXk2XbG4zcgdfGzMMPnlIMCX+VRUMtYQA9R6qavLrIY5C9nExsrFCBHfLvFISYMAaspeLqhqUC1EGW+4web+wERMxmW+H5v5G+Surcs9cMAbYq+LC6H+fhzPWjjWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HsDLLWR8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=briannorris@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HsDLLWR8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=briannorris@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDFbB38k0z2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 09:58:28 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2465cb0e81bso21363905ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 16:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756511907; x=1757116707; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZkOb/hPcVe8gnDPdefZkpPuz6ZACFjeMAIL1vSEcE4=;
        b=HsDLLWR81bWgWSar56CDrIpiSnOCN1qhzi4yVXgq84TlSik3sgi2syt3SfarpSo0zn
         9J9FIH1aT7PKKvLs2ptietfNt4va/vyZjPa9jGyibIz3r0ArpNbPyP2G6K/586YDGbb4
         G91v/qfjRJ1Gf90nqyiBdUcYEkLuH6PIowPmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756511907; x=1757116707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZkOb/hPcVe8gnDPdefZkpPuz6ZACFjeMAIL1vSEcE4=;
        b=jtCNww1hgjjCvzzOeRvzGE2i/8A9gYVXgauDINYo2yTtcH6dXy2J003l+totad6mdC
         oZRfXHZCj/gYsRaCi40/aA59mlUkWFt8+W7OG6FwH/UBj7YyDWN8zyrF/lPoLq6H4oGd
         XXV8MiOjNT2of15Mw1MLbzwMyYx/m49lVoM/S1abyFOFl8c1I/i9YWRPtx3ZFDpeXTYA
         F5tyFq+m+UKrMmLr340V3ggZa9uDPCpN8koKzWr9FZSLSKv9ZTVRS7L7Rxa86QREsSf3
         naPWZ/cDKm+sWClwYqW5UOP+caOU7l56YDjMv2lIX1gVD2Npy5HR94159gbS49eMIF4f
         /EDg==
X-Forwarded-Encrypted: i=1; AJvYcCWYcJWnc0f2BYPYrDFr6CPXk9liee24Cz9LggsgkfdlXnSCx2aHYT4LFLkGkQ3bhfHV5r7jGOEyAEq62xM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz8UcND4AzwiA5q3cfYMuA1SLmziRpDcdpcIlkRrT+HCo9dgvY5
	ly2zqZBU1sIN6jZuROwqo/ZGytuwTZo0S4Zh2RPRPJ5rJCM6HjOi69VXX6VGeLYAkA==
X-Gm-Gg: ASbGncurt03QkZRKKwL4FmFeN9I3TWV3VW0M1i3xN2gLX+DZ+qQVfmMq9T4JamsGxHc
	CGzmb/J/eejCinYbPROHV4Pzl7+HVS+JVWZyZQug/+oWHgc8JtjtGXZAGFht+viCV6rQr1V3HUS
	2bpqneLiLchGIm5V9pNr0wEERNSJK6F0xwLS6aIMZbc4bqnJzKEpi1vp1ssGrYYKHTfqtl9XYeO
	Tb8mPMdMg8Z9C9MbhF7EGBcubU7ZoPPEAVupy0tLF/JJjbbo/b1coEDXd5Und5/4NNpXnxBsVzs
	bIItulzwvH7Bb6AaY8dcU6reSjt9ZfrkrYnglVUUGBd/pzXeRW1XaoAh4D4RGncoJRuZFPlqIYz
	O0mfR0OxfevZ6pkkRKRiBZOsj9ZaJc9aUo5L/Fo76D+d6sPkIrFs46Nhe6Q19
X-Google-Smtp-Source: AGHT+IFvZvVbN+tcqDt9IuyuJa1uB30zy62FBhMsBU2d4G2xup0DO7jJDkNE7M+ZQIjDPW8i5FxZDw==
X-Received: by 2002:a17:903:2308:b0:249:33da:b3a with SMTP id d9443c01a7336-249448ad928mr5527165ad.14.1756511906811;
        Fri, 29 Aug 2025 16:58:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:1d4b:87a6:eef4:9438])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24906390e6bsm36386045ad.96.2025.08.29.16.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 16:58:25 -0700 (PDT)
Date: Fri, 29 Aug 2025 16:58:24 -0700
From: Brian Norris <briannorris@chromium.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] PCI: host-common: Add link down handling for Root
 Ports
Message-ID: <aLI-oKWVJHFfst-i@google.com>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <20250715-pci-port-reset-v6-2-6f9cce94e7bb@oss.qualcomm.com>
 <aLC7KIoi-LoH2en4@google.com>
 <aLFmSFe5iyYDrIjt@wunner.de>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLFmSFe5iyYDrIjt@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Lukas,

On Fri, Aug 29, 2025 at 10:35:20AM +0200, Lukas Wunner wrote:
> On Thu, Aug 28, 2025 at 01:25:12PM -0700, Brian Norris wrote:
> > On the flip side: it's not clear
> > PCI_ERS_RESULT_NEED_RESET+pci_channel_io_normal works as documented
> > either. An endpoint might think it's requesting a slot reset, but
> > pcie_do_recovery() will ignore that and skip reset_subordinates()
> > (pci_host_reset_root_port()).
> > 
> > All in all, the docs sound like endpoints _should_ have control over
> > whether we exercise a full port/slot reset for all types of errors. But
> > in practice, we do not actually give it that control. i.e., your commit
> > message is correct, and the docs are not.
> > 
> > I have half a mind to suggest the appended change, so the behavior
> > matches (some of) the docs a little better [1].
> 
> A change similar to the one you're proposing is already queued on the
> pci/aer topic branch for v6.18:
> 
> https://git.kernel.org/pci/pci/c/d0a2dee7d458

Wow, nice coincidence. It's a reminder I should work off the maintainer
/ -next branch, instead of just mainline...

> Here's the corresponding cover letter:
> 
> https://lore.kernel.org/r/cover.1755008151.git.lukas@wunner.de
> 
> There was a discussion why I didn't take the exact same approach you're
> proposing, but only a similar one:
> 
> https://lore.kernel.org/r/aJ2uE6v46Zib30Jh@wunner.de
> https://lore.kernel.org/r/aKHWf3L0NCl_CET5@wunner.de

Wow, that's a ton of great background and explanation. Thanks!

> > Specifically, I'm trying to see what's supposed to happen with
> > PCI_ERS_RESULT_CAN_RECOVER. I see that for pci_channel_io_frozen, almost
> > all endpoint drivers return PCI_ERS_RESULT_NEED_RESET, but if drivers
> > actually return PCI_ERS_RESULT_CAN_RECOVER, it's unclear what should
> > happen.
> > 
> > Today, we don't actually respect it; pcie_do_recovery() just calls
> > reset_subordinates() (pci_host_reset_root_port()) unconditionally. The
> > only thing that return code affects is whether we call
> > report_mmio_enabled() vs report_slot_reset() afterward. This seems odd.
> 
> In the series queued on pci/aer, I've only allowed drivers to opt in
> to a reset on Non-Fatal Errors.  I didn't dare also letting them opt
> out of a reset on Fatal Errors.

Right, I can see where the latter is risky. Frankly, while I have
endpoint drivers suggesting they should be able to do this, I'm not sure
that's a great idea. Or at least, I can see how it would potentially
break other clients, as you explain.

> These changes of behavior are always risky, so it seemed prudent to not
> introduce too many changes at once.  There was no urgent need to also
> change behavior for Fatal Errors for the use case at hand (the xe graphics
> driver).  I went through all drivers with pci_error_handlers to avoid
> breaking any of them.  It's very tedious work, takes weeks.  It would
> be necessary to do that again when changing behavior for Fatal Errors.
> 
> pcieaer-howto.rst justifies the unconditional reset on Fatal Errors by
> saying that the link is unreliable and that a reset is thus required.
> 
> On the other hand, pci-error-recovery.rst (which is a few months older
> than pcieaer-howto.rst) says in section "STEP 3: Link Reset":
> "This is a PCIe specific step and is done whenever a fatal error has been
> detected"
> 
> I'm wondering if the authors of pcieaer-howto.rst took that at face value
> and thought they'd *have* to reset the link on Fatal Errors.
> 
> Looking through the Fatal Errors in PCIe r7.0 sec 6.2.7, I think a reset
> is justified for some of them, but optional for others.  Which leads me
> to believe that the AER driver should actually enforce a reset only for
> certain Fatal Errors, not all of them.  So this seems like something
> worth revisiting in the future.

Hmm, possibly. I haven't looked so closely at the details on all Fatal
Errors, but I may have a look eventually.

> > All in all, the docs sound like endpoints _should_ have control over
> > whether we exercise a full port/slot reset for all types of errors. But
> > in practice, we do not actually give it that control. i.e., your commit
> > message is correct, and the docs are not.
> 
> Indeed the documentation is no longer in sync with the code.  I've just
> submitted a series to rectify that and cc'ed you:
> 
> https://lore.kernel.org/r/cover.1756451884.git.lukas@wunner.de

Thanks! I'll try to take a pass at reviewing, but it may not be prompt.

Thanks again for all the info and work here.

Brian


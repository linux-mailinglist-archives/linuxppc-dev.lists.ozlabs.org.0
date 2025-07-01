Return-Path: <linuxppc-dev+bounces-9967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A4DAEF377
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 11:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWdFR0Wp6z2xPc;
	Tue,  1 Jul 2025 19:36:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751362571;
	cv=none; b=Ln3ma9/CKUpLeewJcn5vLj0eOcwY4lJHdLPmWkaOUhS3w0Afvglo5NGkO3wQHvqr49LIFZVpHC5Acgjw6IbDIEJTMsgBfSUpdl0y+ijHDMHyhJI+sLq+7LxSH0HgVLzn1pkQModyWgQfyQT64FEIFxpapnXk4B2jHdg411zAjGDyxVeepu6L6ITOjH2WO/Gg9NqFw5gTfNukOORE8j8/922s469jcIFm6kImCZOpQPauW/PPBsFQaVJ3TzVH5+taqU1MaBhe/FJS2EIcnXlTFc0zMVfY+IcNVxDsluHXpJPFak36gcUm+QVhnRk2FcgCTN9t+9Y8gtRBVAmt/+38Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751362571; c=relaxed/relaxed;
	bh=v/H3IsMktglvxqMXdB8Fg26c9yLzFY3z1W+7mWdcrRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMWbqydQ8gdxnyfzn8y2fG+S3jX68DJWMu6ad2ZGOEM0jSyQgEX4EzLwEJHXn/i3bGx5gxT84bYdfP74LJ5lsVuWIiOOir79IaYWeCU0OF8hsX7FUxeNFTIvYOs30rsku7iJHCR60WKVjEfn/DFllBElWIFDdC2S1yuN3lB3YYw5rbyBR+muvLbvB9STlUDE47HF0LfHOagfX0ScmvSO/6yjzN645yl9C5xW6eRmpSoKPxPEuTe7JqgiaFLc1+fJeIK+LZFRiLSxIyrToXUhYINIw6YoVh5BGKByVjt9I2HVgYT+29l7kDuCMTwpep5rQhUhwJyDFG3RUQXX2ABYUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UP6eGtyB; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UP6eGtyB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWdFM0JvRz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 19:36:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07EA3A52CE9;
	Tue,  1 Jul 2025 09:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07026C4CEEB;
	Tue,  1 Jul 2025 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751362562;
	bh=GsyOz9mqKNeqsGPZmBIzKehmEwhrhxpcE/jdlqNHtFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UP6eGtyBwvguzHGGiYL0ZnrmZ/C4e1NRhLFTJqjh9aw0hli5Ec+BMTWaxR4oTrePr
	 e54Aw0AdzFI3I2/VFa9W2JTKQYy4KjFYAQVsjzEjBRZsAh4+pI56oTPpvlil8Wr5w0
	 iL77a2EyOOKiUqPFQCshJbD5u2yl1shnmx72LoAM=
Date: Tue, 1 Jul 2025 11:35:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de,
	yury.norov@gmail.com, maddy@linux.ibm.com, vschneid@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org,
	kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
	linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC v2 8/9] sysfs: Add cpu_avoid file
Message-ID: <2025070123-riveting-struggle-ae98@gregkh>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-9-sshegde@linux.ibm.com>
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
In-Reply-To: <20250625191108.1646208-9-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 12:41:07AM +0530, Shrikanth Hegde wrote:
> Add a sysfs file called "avoid" which prints the current CPUs 
> makred as avoid. 
> 
> This could be used by userspace components or tools such as irqbalance. 
> 
> /sys/devices/system/cpu # cat avoid 
> 70-479

You forgot to document the new sysfs file in Documentation/ABI/ :(

Also, you have trailing whitespace in your changelog here, was that
intentional?

thanks,

greg k-h


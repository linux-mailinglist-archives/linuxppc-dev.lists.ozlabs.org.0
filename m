Return-Path: <linuxppc-dev+bounces-1771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 478A9991BD2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Oct 2024 03:55:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XLljz6dDfz2yGD;
	Sun,  6 Oct 2024 12:55:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728179751;
	cv=none; b=ozdys9MObbuXmm5x347CNmCBfjiTcZnhoam0Zbt8vKcWmHZniitWFk4hjNkJKFmnGlSZjuC/gPyNv+4gfrX+gTTuyASi5+VOJUchZ9iZCJQbqpgUrni5ciqlcJBjXmLbc/CEZkAfMdPd5VPOkiT5/y+rCFdz6q+npdu3M8aBUV47cS6J0QjjXB+3Qd2aI6+A+Cq6F1axy5VYUFXVcH+apog8ybZi0G/oES5p7WDJ7D8tBqRuao2iSNfqDz1mawD4XFwsUM4THaqXzN971sIVaLus17Bny1iuCMxgCrVHJYZ0btfNrDW8BmhyfUjX4WRHBN3HJKA3FMXWOitpa5Se3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728179751; c=relaxed/relaxed;
	bh=i3b6VewzdWsYLb8rinUu6Go1q/V2crmVUsAabrmyl+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H49L38K2KO89ubmZHPOpuqI3t153Sk+aWdaewWZJpIzY/nHZjFxef3bgd+iTZ70d3zbDLQjpftcb+2Y3Qw6Hw/yh9qpCguZNUH1nKkx2V35FBmgsAdL3KFLbsU0sSr7FADkoT+N/KS4BCHLHW5supFR9tslgzpm9FQNI2OZqzvkptI94Y5e71DVnIhbCcsKafORKWbJiUCmCSQU4ro7/PXmy1Mzgd6olwxsvdT4l3tf6gZczMmSfai+W/RcZ+jQzBpMTM0EQGq8VY4sce6lhdW9ckZv12APLFOXaT6RlBBKFzD5ACzyQzVoVC0F27w7CxP+njULZ1115fC0A0c0dtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bHJhnSlc; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andersson@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bHJhnSlc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andersson@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XLljy4k5Dz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Oct 2024 12:55:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86C2A5C55E1;
	Sun,  6 Oct 2024 01:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442DCC4CEC2;
	Sun,  6 Oct 2024 01:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728179745;
	bh=/4L+Waftv30hJTd8pHAaY7MDs2ik61gNjRPrwI78SK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bHJhnSlcDypCxKXc9/0e8sSwcsPUcNs5OrzLmNK372VoYuGepvQT+MeJe7gZxz24S
	 Td8OetlGIX6VQqxeo+oLpBwCwYCr2xh0kr7HWG2dWxJwS9C9I5+F0Ozm3XgnvgOi6R
	 eyo7cMIiqgZ5im6lRwsEC9egd6IBXTkhxhVOAfSeJ6SqQ1OAUWk36taYJoiLw9dpJ9
	 1TD2kMI24gaTyunNoaEycYfyV8WJ6EL2ZaaiP5SsbbYsVWCcKHV7TrlwKb7lUEYqTY
	 l48kzmdHzTLb/dBfgaSN3gUHXAeR3ENezjiB4lZZ+5JAICFVxSM/ycZNnlcwg/pUoP
	 0Njb/XOnUh7ew==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-gpio@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org,
	audit@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-mm@kvack.org,
	maple-tree@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	dccp@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Jan Kara <jack@suse.cz>,
	drbd-dev@lists.linbit.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-leds@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	tipc-discussion@lists.sourceforge.net,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	linux-nfs@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-wireless@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Date: Sat,  5 Oct 2024 20:55:35 -0500
Message-ID: <172817973322.398361.12931602917664759173.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied, thanks!

[24/35] soc: qcom: qmi: Reorganize kerneldoc parameter names
        commit: eea73fa08e69fec9cdc915592022bec6a9ac8ad7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


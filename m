Return-Path: <linuxppc-dev+bounces-16070-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH0YDiCvb2lBGgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16070-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 17:36:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E90947B56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 17:36:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwRzx1FsLz3bt7;
	Tue, 20 Jan 2026 23:52:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768913533;
	cv=none; b=DEEoCCqHsiR3q60mZnDBJyXXxDmT6mlys70HNrW9QD/SI9wzxoZ6pgKRps2TwqK7bptYWpANoDp+0cTYFeHXbF1WAji8luOjSAiqaTRjpghWe4G7qyYDGCP8118oI98rlhuJg2ijnye1yYmEHz880Qu/GdL1ZHIgIWkgZOnkHnqZoKTIDE9eNXaw4mxC2dZbiFUJXovYrknr6x00ZIYG9IvIeBcdKHEEL/U9d4o70b1Sn2fmZQkq0mzq98N8sCJ3uQ5Mdoh3abMj8uG9PESZfVukNJz5JdA126wepuhoEs59bUmb7sOrmJI3JXSqreOMkOuA9lVR5gS+jAW2azhI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768913533; c=relaxed/relaxed;
	bh=BltawuzbsKcWyyUaJNr62FbHUHiJ9m7IQ2ucaRQoWyY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=isSdl+qpAZPQuc0LyeSHVrfhg2cwX88CfqaeHAjuE0mly2JOQpKrmi/6GiR8Cd/K8qe8Cimhyz6OZSa5563rh4fGXvTqVVns8VJppVC8ED54HmK98AeXoFtnzmMRS5QjWVCEx/PUcmCsWwSllEsQzQSaBjUz5WxcpLqnuZsFta0g6Nv1yWigpPO2F+uLcnzjipjUSSxJJdvdYWMyLPQFAwmVbMhZXC+OHj7eGEy6YQAgH560h3HWil4Ly3/8AebOBCGgUu93ej1U0zOLKKQafX/hl/nAT+EF144zsvRnURua/kjKTaP8++5ZTGcOb3q0QoVYUCLX2POz75DeoENhOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RGb5hCrm; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RGb5hCrm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwRzw3wN5z3blr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 23:52:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDBA5442BB;
	Tue, 20 Jan 2026 12:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40520C2BC9E;
	Tue, 20 Jan 2026 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768913530;
	bh=bc28KWZ4Nes1dVdT5o72sgDVqx84W02iDqzED50KaTA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=RGb5hCrmbwFcK2OkCJYJo2brNvk5x9DZplXTFTf57NLeH4f+Kl1GAnC3hEGU4lUgC
	 AD/72LTXbNet5aL6/lpknEYOjrbMCgyB7Nv467G3pUsPFkl1OWCzCR8EAW5nszRari
	 yWXSKQ5qtS8Yq0Vr60xU1K9HKh3K0eAzs/5v70ZEyVZPRVX16C0Ghx7SJorfqWtglX
	 pnrDkaoNxknAfVWCuc9+ITPycHLTB09VXke+aeiABgFJ3xluVr3WUzFEbpbHw1ByoW
	 R1XpRdh6Oc/1RJdmU2xbYCuAHDIRwL16lW/wqAFHC7RUuPzXVbwg5uPVWygvcWvtZt
	 hSCM7GQXKNj4g==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260115061418.4131432-1-shengjiu.wang@nxp.com>
References: <20260115061418.4131432-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,sai: Add support for i.MX952
 platform
Message-Id: <176891352801.86219.3828176720307654580.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 12:52:08 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:shengjiu.wang@nxp.com,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,kernel.org,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16070-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 4E90947B56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 15 Jan 2026 14:14:18 +0800, Shengjiu Wang wrote:
> Add a new compatible string 'fsl,imx952-sai' for i.MX952 platform, which
> is fallback compatible with 'fsl,imx95-sai'.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl,sai: Add support for i.MX952 platform
      commit: 2e48020fd7ced9e9953c55b57a5cb608e64deee0

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark



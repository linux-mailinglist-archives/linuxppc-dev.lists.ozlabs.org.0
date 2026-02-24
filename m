Return-Path: <linuxppc-dev+bounces-17090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA6TFRlLnWmhOQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 07:54:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ABE182927
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 07:54:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKpNh5J2rz3cGw;
	Tue, 24 Feb 2026 17:54:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771916052;
	cv=none; b=bm67x1O+r3kS/GxsHMU5ZGuftAbzr77uxTXTywwH0LEoYh5QDyRxw1uxooJXqcT2OXl/CtmdrTQK1iBPmCx65gMOtqqn8fMKL+9xse8kHU5Wfs5Z1ZRBzLZcfp7M3RMr3MgH9cUNsn7LW8bYN+mFp2n0S5dQq6yT/YhcsdAwHfWAhfwRk5/Tvngs2VzFlEnnujvNnf6ZGGniYKkOx+/OmKJL16nTG2M+6Me73UJyhI7eXu8CEXqA/hzV+STIbQuGku7gaUPbXugncHBEJvP3sdKR1jGKmXHsSZbC/RC0XA19ouI3Xe1LStCMhunmHoRvCCE2OwI84+6kpP7lBSVLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771916052; c=relaxed/relaxed;
	bh=5mkPIWChdAQgXIFhSEQHDBSxI2g3eCHzD5QyGMhqLvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oBdzNG5uqpj3NvovP9l5Q846r2aaSdmsS1YHNJXBUYO+RcMnqjqzTHREGtofuFcabK61dM2SoVORMK30zcj5Na0cLlEE47za5IDF2uvUyDrVDwpVoFG8VRwDe/KvEPNEzdOckS9xxnNnZIBodmwax6NZsQwcfhETVHEqKnkcX+ClJm7OaBRZhN4gO8yLB2xP/PHtcwvEphvhLyh/GnBRpjoIU162A52isZKyvjdPaSPGI6EwKiwzbqVMcGEo3MOs8/vNZV+i/ArG8Yaga3BZWgN77pzF3mOAlsG/cvEhnLwKRGqAs9ZwwmDqXNlamSqMNvDZRsnyIwkwd9U3X+amGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RQ1fcg3U; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RQ1fcg3U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKpNg61m2z3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 17:54:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A18940180;
	Tue, 24 Feb 2026 06:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B19C116D0;
	Tue, 24 Feb 2026 06:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771916048;
	bh=5mkPIWChdAQgXIFhSEQHDBSxI2g3eCHzD5QyGMhqLvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RQ1fcg3UTCQ68dk7NYK7spWLZy7OEzlo8g5ycn27z6lx3WwtAVYxp6HHWp4IMhjjE
	 63ZbJN5w877EcoY+cByaNeIKnrQ88DGzweea2ctWKor3UfBkIbwjzwtmVf8/exjvDX
	 FTN3YRmniI/weFE2izDaOnig44plnXeXSkP3OUv25oTwXS5UUWG4sMsA8ugdMRTxeV
	 rX4S9sz1LS2Mi/4O9TagOgw4rTQ1m7YQYvEHD6R8a23qjlOhMp1K9t/S/mwm+msxzq
	 gp2byJWH48VEkq6OmAcMABuLpQwu4f7j5aSmxBi1l8CWKOODZl9a9IsmguVaV8Wekh
	 RP5jO0coti9lg==
From: Thomas Gleixner <tglx@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/6] fsl-mc: Move fsl_over to device MSI
In-Reply-To: <d289cacf-043d-46f9-9337-b6249b294c24@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
 <kukzdg7cym2cwytx3zgbu5ik2cw7c2zq7irwp6q6o4jzupjzla@qgkrv7emus6f>
 <86ms0za8e0.wl-maz@kernel.org>
 <d289cacf-043d-46f9-9337-b6249b294c24@kernel.org>
Date: Tue, 24 Feb 2026 07:54:04 +0100
Message-ID: <87h5r6vdgz.ffs@tglx>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17090-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:maz@kernel.org,m:ioana.ciornei@nxp.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 62ABE182927
X-Rspamd-Action: no action

On Mon, Feb 23 2026 at 14:54, Christophe Leroy (CS GROUP) wrote:
> Le 23/02/2026 =C3=A0 14:37, Marc Zyngier a =C3=A9crit=C2=A0:
>> Thanks for giving it a go.
>
> Don't know what is your merge plan. I wanted to push it to soc fsl tree=20
> but it doesn't apply on top of v7.0-rc1:

We already established that. Marc will resend and yes, feel free to take
it through the FSL SoC tree.


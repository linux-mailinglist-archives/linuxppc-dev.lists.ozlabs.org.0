Return-Path: <linuxppc-dev+bounces-11273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8BFB35196
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 04:24:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9s1J3k9Gz3d2c;
	Tue, 26 Aug 2025 12:24:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756175060;
	cv=none; b=XsQt3tiHcvRzat1FKyJQTwN1wsy20fZdVmYMpDYER3M/2DPk3VutCWLZetQ2tpKA580dxuYy6DrfmojieEgCLjYUGz7kPS9gvyKUfRue5t3RiC+ENgDwy1fq1KqgOn0Dan1WbnYUrTCXF9PEZbyts/hlUgukCeEh8dPqXXpDM7jkPbcXgokRwNn8VrZ/5teHFjUVWrtrEWj7UVC940o1+tD9SNMn1iVmQPMcQ0GzA4tnBKfXPoP7hlkcG8xcR9ko9K8C23kTSR0uHsTvQ//b0aiwSFMTLxTsfOJc34+zkDhPtc/2AwInwezOy9sGwzHh4uxf4vUWMdHgaQ1tTc039A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756175060; c=relaxed/relaxed;
	bh=594uDg3M0fFpZscnaqkoOx58Hu0BI+Ph0xC0TYU6Dio=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HcaHE+0MFafQ5EG2v8IWqwdwnd9m+L3iqINNJbXCrVs7skG4oW+22MffaLTWXIIlyz2LL+xollhCXwj4qLZkQoqK4kAF4FuyHlihI63xwru+wQL46unx7jJoYBtwWCTaB5SnJn+dcpdRWoSSG8MZphJWn1YSH8Fsm6Pgk/swMPohWcjt1rXTIHshpE9NEZBD3ZszEaudjV1//qTO421K6bZZYpstBkEPcUe7Zg8i07YxRLKJHNxafEsv/xcbro9G0jA5rDO+KWkVgb+VRiHe00J99YFkQNu2IqR/OsymoWDnupwTqpPQsVwh3O0fmrsf3xxyEPR6Aw/KxscuyQ+QCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=jeiz7mIj; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=jk@ozlabs.org; receiver=lists.ozlabs.org) smtp.mailfrom=ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=jeiz7mIj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.org (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=jk@ozlabs.org; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9s1G5k8Zz3d2N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 12:24:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1756175057;
	bh=594uDg3M0fFpZscnaqkoOx58Hu0BI+Ph0xC0TYU6Dio=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jeiz7mIjt2dJKWUpSWBc5lu7x4Lj2fbeVpZ01DVvdKbtHMWfM8FD/7r5ojFno5IS7
	 vmCOd1g39pYvWGw2GJPCFxVB7LR0Abx/KyTihtI2tlCMswVK52rMyQpYAZMuCC+B1i
	 0gUIQ21ulT9DEXTW4IqSkN7oEzJZFgCfEDHOiHnEamIS7WnY2ji3ygpQUhTzqoqsMU
	 3GCi6/PihGkAaod86bnlhJP+w7jYa4sK2jjV/ZUpgbdIELF9PZ+0YnkxvAggRMrI5v
	 iUEx57iuOsQK+oqf0a4VsrUK8k/u4AmRLelVy1u/cbv9ektnEgEEfIyJU934VhmHzg
	 c0io65RTn35JQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c9s1F3b5Wz4wqR;
	Tue, 26 Aug 2025 12:24:16 +1000 (AEST)
Message-ID: <7f5a74dd2e50877408a47e5cca7d241de7053579.camel@ozlabs.org>
Subject: Re: Ozlabs patchwork notification not working anymore
From: Jeremy Kerr <jk@ozlabs.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Stephen Rothwell
	 <sfr@canb.auug.org.au>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Date: Tue, 26 Aug 2025 10:24:15 +0800
In-Reply-To: <7b7cccf2-5899-4334-9aa0-e83f0772d484@csgroup.eu>
References: <8f6e5825-9468-4499-9bbd-4588a1eccc94@cs-soprasteria.com>
	 <20250729183222.15adbb95@canb.auug.org.au>
	 <cd2ee23092e3749f707b0f730af741a94f0986f0.camel@ozlabs.org>
	 <7b7cccf2-5899-4334-9aa0-e83f0772d484@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,
> I still don't receive anything it seems. I have modified the status
> of several patches over the last two weeks and haven't received any=20
> notification from patchwork.

In your case, it looks like you have previously opted-out of email
notifications from patchwork (for this sender address, at least).

Your user profile page ( https://patchwork.ozlabs.org/user/ ) will list
the addresses associated with your account, and whether those are
enabled for notifications.

Cheers,


Jeremy


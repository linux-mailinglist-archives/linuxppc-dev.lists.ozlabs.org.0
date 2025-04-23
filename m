Return-Path: <linuxppc-dev+bounces-7932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85055A97C0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Apr 2025 03:16:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zj1QF4GVDz3bb2;
	Wed, 23 Apr 2025 11:16:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745370965;
	cv=none; b=g9ZccK1gggeP/Uc0Lefh5ZMdlDtU7t8mhkWR4ar/IOB0QJb/09izAZkW0HntZYnviXAfzrnxGcT0hZDC9z7eLudE9EHf8rGDjxzvTT7SgTxcVo8ycVHPlKBTgO0LyWwyNekREhw+QEZbScXg9fUhB3NLyvMQcMJxKfXAliVPl7vCFq/LgFO7rE3oVHlGaVx4+R5Jg7WHmY7JCD4Mq6MmwxTcPFQ3IxuEpvrPuhKPF+XEyBXsgoEKnL89QtOQZ5gxhNOfkI2aH9i+W6ZqTwBJNUKIYzoT7enywAcmEBxafMI1X7WBFLhQZEGxIoW5NJvbsKX0N5aadAicPkcovUfxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745370965; c=relaxed/relaxed;
	bh=AYcR/hTdKqF5b7/NJn9au3U5NFKXILJxHP//HtCQfbM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lFh+7Dmez6P0pbpHhrI9T/po1QiM+F6kGsHRJkf/qYjywgCl1jt9HozjNmgm55HfQdVEePprJwaW3vk9OwE5MBmLXap1X1DfgMxaMS7b5YcYec5wsC+lncttOtb/VjLuaXYCYT7UCiAc1D7uzXKpkd09ZMN9X7fn6H1IFTa/UwOiEPKABDlRpmtiOR66sl5ovS4Zjx21hcZw0xgu8ga4qQ6aHBbHHbQvyvnEDLNHPtyVoB0eEubnzpyu+89kMie6mrtEvWsoK9STpRXLBFqDVbwiXKK63CVkEElq7bxN9r31TKfLtaO5xecVNQn+OH6rgdlR1Td42fqg/UXqOT3etQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UgYCvE63; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UgYCvE63;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zj1QD0STqz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 11:16:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 162275C5734;
	Wed, 23 Apr 2025 01:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A46C4CEE9;
	Wed, 23 Apr 2025 01:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745370960;
	bh=DDBIaRd7/PYETMKxsfw80fEdg/3qTd4YC7ybdRiF3IQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UgYCvE63DpBhwexZaJb/qQBKqOVO+MaySxlUBNWjB37D+uleh84zteo6hp7rp3s2P
	 0psQ6vn+ou44LvatYSQAdEqPfXcbrII0WF3F476vHzJbkamxZYGRXhhtTtY1ASUcIV
	 8p4ELcy19cnRy6KnyV+mazkZRTulB6J3OKAEanHenEOdgG2iwDMNJvC2qx8QzqM+Ar
	 Y2nSdm+vAso70ZOxiq2ttbzwCiTxg5S5UmJAP4UFiMh8UjLvaXsnh/OS/KrpsBKgYz
	 AnjNvl0y4LZ9iManymFAaBgTri9rQ2+lMMugWwlu3HX3gcLuADzKLJ21/RzcY/4fUf
	 lEj5RNzaZTsyA==
Date: Tue, 22 Apr 2025 18:15:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: netdev@vger.kernel.org, michal.swiatkowski@linux.intel.com,
 horms@kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v3 2/3] net: ibmveth: Reset the adapter when
 unexpected states are detected
Message-ID: <20250422181559.64b6e63f@kernel.org>
In-Reply-To: <20250416205751.66365-3-davemarq@linux.ibm.com>
References: <20250416205751.66365-1-davemarq@linux.ibm.com>
	<20250416205751.66365-3-davemarq@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 16 Apr 2025 15:57:50 -0500 Dave Marquardt wrote:
> Reset the adapter through new function ibmveth_reset, called in
> WARN_ON situations. Removed conflicting and unneeded forward
> declaration.

There's a schedule_work() added but neither cancel nor flush when
interface is shut down or removed, probably a bug :(
-- 
pw-bot: cr


Return-Path: <linuxppc-dev+bounces-5429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 170F1A17474
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 23:00:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcPRF3sgmz30KY;
	Tue, 21 Jan 2025 09:00:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737410441;
	cv=none; b=erqj2rd5gLJ+Q9FrfNym3NPdXIGEKq30deGldRe8uUirAkBaLJ4NJTf8zlpZ5O0WnNEJi9jqaHn/Zz5v572/I/g8OW1oFWR/KR5OKWOs1RJ8EPGD4bvP6oqsBlCeDVF8p8KA7eJScwrU5T3waxQhUWojyUwuufZaaanmfhT4eY/hzGjgOQJrYjYMEJt3jiGQMycxZRjndWhOblapV/VVJp4ybn7efbHnt3qLcs7g5QS7jRXJOozF5WOzaWf1CJ9zxyqqwgsc41rn4w/4ZVF7yZPwWiC6V9rmKSgBAnCuaqXuJs9/Mx/d6Bd/pycMhXh5U92hq5ma5uTSs7iBcgLFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737410441; c=relaxed/relaxed;
	bh=0VBzDlbXYdy/UmsV+7csHAfHvMtvGzDQ7LSEmakNkrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITcXLbu7ssGemJD0lpqaWVoAGoqUcDnYnMJwmfiGDpVOcROs6htTqJEcAIZDD0CnvQSq7ZTdmrUhaSgLL/OJLJQBxkLAgxRCSQ6G5Yam2CHYQ5WHNb0e+0IuQHihqgOw+URNP8V0dhjfvcajHE/oNLTOey4SJlw8c6uyW9omFA6icnnMpimGXPGHTLDNaVf6rm+1NxIY4eLAuGLZoojODDLRCf1oD/efRpCIawz2oDiVl+FGYea8XGKbLDKg/lUqvjTZcPBLKOHub+cfJV4sW1u8O77LegHllwHaO3Dq6ITkvZDc2AmRjHfzxDsHR/OktZl5r7mlDhOAdyq+DNLHdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KSz3FXjO; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KSz3FXjO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcPRD6q62z30Hf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 09:00:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44490A406A6;
	Mon, 20 Jan 2025 21:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE52C4CEDD;
	Mon, 20 Jan 2025 22:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737410438;
	bh=QydTgFx2tlV3wKwstA1o+PHgPAeyZHx6Y5RneVhyBxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSz3FXjOnhJSy+OViALjtWEPph6mytJgOz7i+y2ylB3MRrDTtCgGvj0l0Q7+IrAp3
	 FDZjbc0e4xG5lsHdKOy5Np6xziYExDu53QsRIY3Es3iEy+LN5e9HYrOjhH9FZJ+1J0
	 VTMd8hZDRbZTSxa3X2V/4ff5u3s0fwEtbQxq9bnIcUte1Kp7xJaCFimsbXMH2q2qS2
	 yTG4CSaiUXI3AA0MRE0BAOyPOvxH3N0B0Np1MxXQnJ5PCmA1KcqRl4Yxtz5eHVYtLU
	 fgOU6Ej9LTu906sGjQPavBoyxR8u0j/cNfI6mR/ymR4X++b35Z3gtnzba6AzrLVCOb
	 XiMhu1kEiP31Q==
Date: Mon, 20 Jan 2025 14:00:35 -0800
From: Kees Cook <kees@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] seccomp: remove the 'sd' argument from
 __seccomp_filter()
Message-ID: <202501201400.3518CED7C@keescook>
References: <20250120134409.GA21241@redhat.com>
 <20250120134505.GA21290@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120134505.GA21290@redhat.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 02:45:05PM +0100, Oleg Nesterov wrote:
> After the previous change 'sd' is always NULL.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook


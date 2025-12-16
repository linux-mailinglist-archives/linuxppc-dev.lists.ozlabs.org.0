Return-Path: <linuxppc-dev+bounces-14791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE8CC18D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 09:28:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVqnS4DsGz2yDk;
	Tue, 16 Dec 2025 19:28:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765873692;
	cv=none; b=XwyDLrJzjzwgBOk0Fb6uyWdHrQEtiqCGDghOWF2SOwNKujPHvYHda6SmOs1oMUe+jeyHgIZZwyiwUjzBzwAcaNZV7wv18uyeUYsha2GBwBSU4LgGC8F9+adEJ8fo6RYehiFoKEnZXxZvwXvoO3rlD/LZBdVPA89C/FkcZxOLvpWZo9KBpbVptBkf6uDJdGZQ9VKNN/j1cmQeWp0BCn5w6aq6HrhBIUttnduagCapj5D7sNsO2s1uY3Szjl4Lpup1ecPXxysTWvRi2MVQB476ZrGBLKXP1Iom7hUUAEpgCm14dUXeK5HT3gVsT5Th+4Hok8ULxAQzIxNeo6HZcIFZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765873692; c=relaxed/relaxed;
	bh=18QUzibWbUvzdO3mSa7PVgq3DCScRHDw8cH0GYL+t4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jc92AefNcoi+E74jt2+T7rvwSjcctv2zjRIJZrYyxs4i80a9lL/4UArBpYsbllj9eFy07trO8r3Jv6L02Ur+qk7gxEOvgSae23PCO79kuwTc0/CacyGLgDpWrPgXMIXwIsFF1qHebzF0/oq55NTvl0tMTjX2abIBFr8sYI1AW+/FLWRXxdepJnAK2h26xiagUcod0bUDzs67xmvUgvecIYJUBkmAebop4d9yXwasRyMQHYwFJDWS0m5shuG55wXdABmLTFOXT/ssZnojPGTO33Xv+Cd1vlz6m7HhRAwLHcxzr4vO9vDiPHpMqQJkfvlKSYaVSqJmlV1I+fZo3mDOwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JpH0ju1F; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JpH0ju1F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVqnR5gdsz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 19:28:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2922460173;
	Tue, 16 Dec 2025 08:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4B5C4CEF1;
	Tue, 16 Dec 2025 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765873658;
	bh=rE9Ya5hAlvxFBkqWRdp1h1Tw4atfvwW4q7E/otCHqMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpH0ju1F8NUs3civI5pVZ0tGQuWRgVmJea/HUdFrdPkxzabRyvvWngSvPwbNCTYPM
	 LJhIccwNtxPnFVZsJpjcpGl6URl9HoPyZlVGLkXNQioxIxUlUHqExaKN17uE1o+paN
	 YIuIEHbyBtzPN2eAcDgL7HhmXY/jt4Sh4cJXRHafAOdEeo3X/RvSkX8KvfVxqYwkN0
	 JX856NBteLWPccrXuACAGyV7qGbQ2wZXIYL2a0xP9lOzCYR16+RdIzhXRdd/aRzbla
	 ShNeBUsczzSfo6Dy7whFpMq3VOLTjncclOgtP5L92fUVPRhMUtuHyyH7Dk+zoItnnq
	 rMHeQFc4RhbtA==
Date: Tue, 16 Dec 2025 00:27:38 -0800
From: Kees Cook <kees@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <202512160024.B688A8D0@keescook>
References: <20251215163520.1144179-1-ryan.roberts@arm.com>
 <20251215163520.1144179-4-ryan.roberts@arm.com>
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
In-Reply-To: <20251215163520.1144179-4-ryan.roberts@arm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 15, 2025 at 04:35:17PM +0000, Ryan Roberts wrote:
> [...]
> @@ -45,9 +46,22 @@ DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
>  #define KSTACK_OFFSET_MAX(x)	((x) & 0b1111111100)
>  #endif
>  
> +DECLARE_PER_CPU(struct rnd_state, kstack_rnd_state);
> +
> +static __always_inline u32 get_kstack_offset(void)
> +{
> +	struct rnd_state *state;
> +	u32 rnd;
> +
> +	state = &get_cpu_var(kstack_rnd_state);
> +	rnd = prandom_u32_state(state);
> +	put_cpu_var(kstack_rnd_state);
> +
> +	return rnd;
> +}
> [...]
> -static inline void random_kstack_task_init(struct task_struct *tsk)
> +static int random_kstack_init(void)
>  {
> -	tsk->kstack_offset = 0;
> +	prandom_seed_full_state(&kstack_rnd_state);
> +	return 0;
>  }
> +
> +late_initcall(random_kstack_init);

Doesn't this need to be run for every CPU? (And how does hotplug work
for such things?) And doesn't it need a get_cpu_var?

-- 
Kees Cook


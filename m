Return-Path: <linuxppc-dev+bounces-2719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 234D99B605C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 11:40:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdkCp58RGz2ydW;
	Wed, 30 Oct 2024 21:40:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730284806;
	cv=none; b=i4ICMtryyp5hFn/HCvQkpFkbpJp18AVH5My6JvXB5/deGNfjzMwj5agHjNzxGMu6Bi4J/SCvJmi6769bmY7vPXCSVqVb+V5dkCeR6FX9ePzbW4mth7gZvx7IdMEKrTX4lCbtqg0jRkdB3DwAysy2sUp54xYNxUG16vqnXeCvRfwWmpsAcr4yZXa62EqAO1vTwC213ziwMBppdLX2Joom7SDbSpPJwGcSJuKAUuogrsxVmZ79YVLheUt2XozP7HRI1D0B3MvVfJk1bls22PrnKKf5Jf6R+29t6altNnxNxbxUOq2yAwl1GVa4iGaWnDBvYuu1uo/OSwFCgwRR8GSySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730284806; c=relaxed/relaxed;
	bh=Z5zeClzjkLB2fwj5NuKVJcICjOwHMYB7WeUASTb/YtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiY/x9qsUWIDriuuBrkG3+8kjturmPKJtuClcg/HyZ5WZtW8t4i4XlyvCbqZCVbij+cAXWRzMkkCM+Rv9PpvBfaNukkWQl9SVXqcZhsuH5VkF22oOKEPerUBUm2mjJXOpbO9GDQa4BzAKbTErf/vBi8beqQ1Fo6sE682XGAd5cid1boPTZc2FQfZuvPn7D77pg5Xk8i5acTQqS5UsUAeQxKujaxD0SDcpwMRY15mDZ4mW+GUxiW03+9dcFRWTz2eRuGNkQVb/GQYOlpr0Crk45mVaqsCXvRDpexFy+NKZuHM196iWlnoCnkWEVGodtP61kpqJC23OOXN1IryDB99kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.208.176; helo=mail-lj1-f176.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.176; helo=mail-lj1-f176.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdkCn3tTZz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 21:40:05 +1100 (AEDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso90559511fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 03:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284802; x=1730889602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5zeClzjkLB2fwj5NuKVJcICjOwHMYB7WeUASTb/YtI=;
        b=Dm/GtCPJ9UhyZTMJA29wm4Jz+EDRf/7wZQT0OlHeKwukcQqSL0AbcJQHDxindUsaeq
         4fxfVWlHMeDde6FktnqErvliWmb/tI4OjjfzpDWuHbhTuBfI9Bge74WamdfazjVYO0hq
         pQMeLrNcsHGrcK9OH4eaNo+QNO1PYKLelOYyU8BFsJQgwtptdz8th++dw3qG0bozN0rx
         FVRSuNgWkyffSHxXZX0JzkH7gsn+C5aIt8Df/rkHnlecs91yuOqO7/0jQUMjZP11RRj+
         CmCRuYMKXJKHXk7VJmsCbqIS6VxWL6zXarfM3bkplqqMui0svPHxSDWFVAVglpqW8pw/
         KRcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTHA09Eb7gFDz5ysjZ43u2Imi+uJLPcZcnTVorAwphxSCQDS1nCvuA9CEXMDQoQ8WBiEcGGy1qfDGVNuY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzkiv3acZq8uDTsH6aUFR2dMFAfGOpfwOIY/Kz5aiDV2tXx0zbK
	P3S0ucqCsbAM9u1r6vSpUrM/6dUQd+pBjvEianX8WpDLdkY6Mw6r
X-Google-Smtp-Source: AGHT+IF1BeMOioe7t/P4H3j1JzkGprhgTWXKnwqJJVpJqtv4+UpyysQM6plM71Gz04mozafT9jF6YA==
X-Received: by 2002:a05:651c:211c:b0:2fb:63b5:c0bc with SMTP id 38308e7fff4ca-2fcbdf60dfdmr108666691fa.3.1730284801674;
        Wed, 30 Oct 2024 03:40:01 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-115.fbsv.net. [2a03:2880:30ff:73::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a0887besm558559566b.207.2024.10.30.03.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 03:40:01 -0700 (PDT)
Date: Wed, 30 Oct 2024 03:39:58 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Radu Bulie <radu-andrei.bulie@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 1/3] soc: fsl_qbman: use be16_to_cpu() in
 qm_sg_entry_get_off()
Message-ID: <20241030-enigmatic-mayfly-of-triumph-d571bb@leitao>
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
 <20241029164317.50182-2-vladimir.oltean@nxp.com>
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
In-Reply-To: <20241029164317.50182-2-vladimir.oltean@nxp.com>
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 29, 2024 at 06:43:15PM +0200, Vladimir Oltean wrote:
> struct qm_sg_entry :: offset is a 13-bit field, declared as __be16.
> 
> When using be32_to_cpu(), a wrong value will be calculated on little
> endian systems (Arm), because type promotion from 16-bit to 32-bit,
> which is done before the byte swap and always in the CPU native
> endianness, changes the value of the scatter/gather list entry offset in
> big-endian interpretation (adds two zero bytes in the LSB interpretation).
> The result of the byte swap is ANDed with GENMASK(12, 0), so the result
> is always zero, because only those bytes added by type promotion remain
> after the application of the bit mask.
> 
> The impact of the bug is that scatter/gather frames with a non-zero
> offset into the buffer are treated by the driver as if they had a zero
> offset. This is all in theory, because in practice, qm_sg_entry_get_off()
> has a single caller, where the bug is inconsequential, because at that
> call site the buffer offset will always be zero, as will be explained in
> the subsequent change.
> 
> Flagged by sparse:
> 
> warning: cast to restricted __be32
> warning: cast from restricted __be16
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Breno Leitao <leitao@debian.org>


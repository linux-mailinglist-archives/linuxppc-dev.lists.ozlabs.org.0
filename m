Return-Path: <linuxppc-dev+bounces-14136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C831C5453A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 21:04:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6Dqn4Gvtz309L;
	Thu, 13 Nov 2025 07:03:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762977829;
	cv=none; b=B/OKe6Alf5h5pD5ogiqleZnBWf12Uwbdnu3TOMItiEeYYF61LWBnnbiqsLibew1hUmwg7kC+GiRhjGEbA36wkEI8VdeBgS9Qw7q+4eURNFrTUgQ9oY9z3K2Xs+lk3G6FhQLFespLafR9paQEb88FX7p/7pd9EEHgWDTz8y4griXK5qfO6uptygRUPxOB4gwJSkTL29LvpvJuN0y8y19j51aINmV8WFRjlqiPB6NE1Ez9p69odktgjnvVWw0sQkqyQckdN613ACFPtur6PddA84qkpXJqG92KWjqt644dWII21ZO7OGH996ocvgJTHqkE7CKivK+R73NHYXz5Q+75rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762977829; c=relaxed/relaxed;
	bh=C972XIiVWjgW8EWVB72NDL0DG2RMJeJmhktIDttP/b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvPrJgo7Mch82TzwUfGTLUeZS7+EKV/PRqr3/ZKyGUL3JuBitwNg/Y0tDCvJ4/++XQoC6F9CBDl+UDPSAphtj6xiai4H3JBerudQvgH5+aNfUI8fM/KpjL8/o7ofE00//P57UoobvHe9NYV72QENPrD70ZMUqzOq9qezVdZggvFb0ip69fzRBxQ17cRFVhTmQoeyWoA4sok/fVR4OL+w4W8u76sHbj/Lk/BfGiCXhERhx+g/vsn77wqUPtejnXE8rcDiMjCXbKRJiiHZhzKhtVrl1oARkXTcoesEx2a8OvUKV8xryI341u4fa60tnm7fBTxWvyvGah9DPzDLBhvdSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pseUIglz; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pseUIglz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6Dqn0pxQz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 07:03:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85823445D2;
	Wed, 12 Nov 2025 20:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9848C4CEF1;
	Wed, 12 Nov 2025 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977827;
	bh=yPtrlmY0IQVG2j8kOjS21draicu9LupkNCxZyl2KJs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pseUIglzfH77wCOtINpw4wNljlqAXfilMaf+ELGuMA4dE9ngP9hIwCAr6f0booGAI
	 KGS3ahcwI3EKsfa02eyAbS5hdRtWdzVsGzXuxWciW0c8UB91X+lv73569lka9lXOjo
	 9UgY/UZ53h5zs9LLLMTLHGLG9gOXpN139PBlV8xn7dIvZkyWvDK0YfN3HF4VhLPRpY
	 F1ii9M1+Rt8t25qp/G5CL+NO2XGWqVT3q1gZiL7tZmIyG9UAiZL2XLfrk9wk5wTFm5
	 o50YhE0QEdM1vOQMLJ7P4GtSyESJbHIrkZHgt2Nei0dWtoOsa/+sLdTKSJBLe+T8dj
	 puB2ZKLo9xyhA==
Date: Wed, 12 Nov 2025 20:56:46 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 10/10] kbuild: simplify CC_CAN_LINK
Message-ID: <aRTmfreiEEMez2gs@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-10-faeec46e887a@linutronix.de>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-10-faeec46e887a@linutronix.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 14, 2025 at 03:05:25PM +0200, Thomas Weiﬂschuh wrote:
> All architectures supporting multiple ABIs have been migrated to
> ARCH_CC_CAN_LINK. The remaining ones do not require any special flag,
> so simplify the logic.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  Makefile     | 11 +++--------
>  init/Kconfig |  3 +--
>  2 files changed, 4 insertions(+), 10 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas


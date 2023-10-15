Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E426E7C98A2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 12:11:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HmEGUjqt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7bcf5t6Cz3w5B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 21:11:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HmEGUjqt;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7bVc2ckwz3vhY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 21:06:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697364376;
	bh=fNILS6uDqzn/+3Ar+0VrGi84TCCExiQmIbL2jAANHTU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HmEGUjqtwXU1PP3R09/L84YDDHpybyRlLIClTp2AjvJEN9hrp9HDTxTQiA8OSrI0D
	 AsFwtIMbErrBzRJVj/rcBQegAjUM731KhBdMDDzpM2KYYWqm/dmCXxq8Frwgm7IkLP
	 xjg01JzXJatVjJc1t6POPdRaiiVIpUt4/U5QW44STccatnTWPz9V9bmwpcGUp5PQaS
	 XyKlqDFEQ28OtjMnRK4frK8OU+RuP59BS769h/HWObHqsBqMMCyUD0KC/aP7G6I2Gd
	 WlvsC3pYY6ROEGXRCV4Om+E0Csa0G/VONr0CmOe30g5BCDMnBeJ9PlBKEpyEzqleq5
	 kvorUc+Cz+b8w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S7bVS4L6tz4wdF;
	Sun, 15 Oct 2023 21:06:08 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: npiggin@gmail.com, christophe.leroy@csgroup.eu, sam@ravnborg.org, benh@kernel.crashing.org, linux@treblig.org
In-Reply-To: <20230825142754.1487900-1-linux@treblig.org>
References: <20230825142754.1487900-1-linux@treblig.org>
Subject: Re: [PATCH v4] powerpc: Use shared font data
Message-Id: <169736429855.960528.2851417902761239149.b4-ty@ellerman.id.au>
Date: Sun, 15 Oct 2023 21:04:58 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: rdunlap@infradead.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 25 Aug 2023 15:27:54 +0100, linux@treblig.org wrote:
> PowerPC has a 'btext' font used for the console which is almost identical
> to the shared font_sun8x16, so use it rather than duplicating the data.
> 
> They were actually identical until about a decade ago when
>    commit bcfbeecea11c ("drivers: console: font_: Change a glyph from
>                         "broken bar" to "vertical line"")
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Use shared font data
      https://git.kernel.org/powerpc/c/0ebc7feae79ac07772a20382eebd8c3503313714

cheers

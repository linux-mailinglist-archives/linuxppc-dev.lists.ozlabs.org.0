Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE59D354B05
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 04:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDsNG6Cxnz3bwh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 12:46:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uKKaylaa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uKKaylaa; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDsMs0r09z2yjM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 12:45:45 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id d10so4483267pgf.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Apr 2021 19:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=mwaT4uJ3dyzCtgHHHo77GKmwrwVzqNTg7DCxqdjDNlI=;
 b=uKKaylaa3iXC3UXqK/DH3A4CgjGvwk1U7ZyXFARddcUh6SHsa1Jokj5LCHN1XWQc+A
 uGcP+PyZrD1ZeQALNIEeV+ODiRF21bMWfykeiAq5Ys4gt4I0iOR14HhyVgKNREjstzws
 rfxeeyp1B7+2xXFHqePM3TgKCEEJoBZ8JePElphj6y4J/242CxFgmYzVo75zu83zWsn+
 YRY/f7LNC5WO5TTtHpLiZvPtW7wQEGSIXw2Jfru5cgYRWnPfUXB9rrU4QNd75Rh7giyC
 KYbhpQrzQSrZXOvzUFAoW/oJaxcbw8F2enVifzw7XJ+XJ3BLNQgECq3Au/j0aby81uCy
 cSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mwaT4uJ3dyzCtgHHHo77GKmwrwVzqNTg7DCxqdjDNlI=;
 b=PWDdr6ub4deq0EkC4lWQBbncdr0GTw/0idOY9+Yi7va+tUvUgEUtScOJFGIv6EwqLF
 w6Lle2jYc3Kl7ZI9GravXJrnCOMtL95l2CSGM4JuGsAGAnKx25/D6Q+ru3iylZasQlvR
 5ZWjv9Pi0L+sExEhtYFgMjL+q0jxvHCQvvIPGGlBC+nuWjXcHYHpGU87gfxtLC08153J
 U/sSTnxkVyetSdXKEOEWEo+uTscg34rwUqdI7fCtZERJ731Avl4b8mqBmaxfnI3DbMqM
 qNZP01aAlHsX+Pl1XKQpgeTPskSfAUVBIqD2Uy0oQ/JsglECNj/fwQPYq5iFO5kI5Lff
 s+Yg==
X-Gm-Message-State: AOAM530CauZF26vNOOdOBP/5hxI4el5nATCkVsOzF6uFNOfBh9hWyHkp
 lMsW7iV1kaGjzP3YUYYcqbZwvnKEbMOOlw==
X-Google-Smtp-Source: ABdhPJzVuTdXuGKWUev/vWncqOw9oVwgSclazb/RHzXlsUOA0aSTN0HMHQ+8Stw09bC1bhsNuQjJ6g==
X-Received: by 2002:a63:c446:: with SMTP id m6mr9665388pgg.71.1617677142749;
 Mon, 05 Apr 2021 19:45:42 -0700 (PDT)
Received: from localhost ([144.130.156.129])
 by smtp.gmail.com with ESMTPSA id q19sm16057055pgv.38.2021.04.05.19.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 19:45:42 -0700 (PDT)
Date: Tue, 06 Apr 2021 12:45:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: power4 nap fixup in C
To: Andreas Schwab <schwab@linux-m68k.org>
References: <20210312012044.3660743-1-npiggin@gmail.com>
 <87y2e6fu7v.fsf__9754.75274478725$1616992871$gmane$org@mpe.ellerman.id.au>
 <87v99aj7tr.fsf__47134.2879392736$1617031867$gmane$org@igel.home>
 <87r1jyj5e1.fsf@igel.home> <1617262357.w4yq2kiecw.astroid@bobo.none>
 <1617627247.3cjpyzcob4.astroid@bobo.none> <87pmz8d6ro.fsf@igel.home>
In-Reply-To: <87pmz8d6ro.fsf@igel.home>
MIME-Version: 1.0
Message-Id: <1617677100.it1iqiczd2.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andreas Schwab's message of April 6, 2021 2:40 am:
> On Apr 05 2021, Nicholas Piggin wrote:
>=20
>> I worked it out. There was a window where it could take another=20
>> interrupt before the first one adjusts the nip.
>>
>> I managed to trigger it in qemu and this version fixed it.
>=20
> Works for me as well.

Aha, thank you for testing it. Finally fixed it. I'll resubmit the
patch.

Thanks,
Nick

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C594B1CBE85
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 09:49:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Jzr00YJrzDr9M
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 17:49:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uWMG0rGf; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JzpJ1RhFzDqdS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 17:48:23 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 145so2176545pfw.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 09 May 2020 00:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=XnVJoQLjqBDyQA1aedelioNyhMhbLjV3DWfxQPP3LJQ=;
 b=uWMG0rGf4W2OPrbNLmJKU+h47GbEaHP5WpnOH6nXIY/RvGeFIdc6+i45LapP5EJYw/
 DUwZqvT6hgT2nvux7NZ8smlTTfev7wIpsWcrZOvpnKfNfmw+KrOX99tyTZaNdGmtVW67
 1wQBY/4S46F+2pIZX2xLBOEtfJc61zHAbSkExU2Ky8o7WKAr0aJwBM/Au0gswS7SoBy1
 z9kiwiJBxxlzXVtEGKQVIp4DBsajBbdFtB+Mx8M6OjAELLf5EdT3v7SRpbdw3pK1nUeK
 /zhyLp6YNxVowBIBRHps2LJvi5+FFchWhh7RxiLwg2rbinqKD+TfQIYXT2jl629phh+9
 Ez0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=XnVJoQLjqBDyQA1aedelioNyhMhbLjV3DWfxQPP3LJQ=;
 b=bmplIiRYX1eeVXPLM7UgvpvO3mDVD+0pVWVLnglbc1s0S23bUdsqu8EEfGcLRg/I1E
 cmSEItL735B9ILg/p1dJIwdUEgrkYeisA6XETmPBuYADDKWtLAX5kX/BL8IH9Ar5IhR8
 3waEzWX4lBN8dL9RLo5hy9QPo93d0cDZ79Z65IOzxxC8KC1T68FIdNZ4Unt9LzUaGuRY
 wFrEynxq63qjkq3i7vBVbRnVS0vzlgurT0iJtTIABnOu1qaLT+DjSjZL7muJ/Dz6yxe7
 ViVnIBtQexCOci6Z4kn2qzne3yr0B2iOstTsPfldYuwx8xPG1tIkDJb3WaU5gLhewXP9
 Hcmg==
X-Gm-Message-State: AGi0PuYzJcLiEUS1BQWNFmbU5p0IdoYDtrJJIiRrm7dcjDvcBwdKzbAF
 y6p4YaPcDJ2qOdab/49i3G3X6Uh/
X-Google-Smtp-Source: APiQypLpd6yqp+YEsx6kVMcy98VSARzOjzr7fYrA4Hsl4wp2V6iyr1toS3IkWtssxCdtePwb9/EZKw==
X-Received: by 2002:aa7:85c4:: with SMTP id z4mr7211491pfn.199.1589010500762; 
 Sat, 09 May 2020 00:48:20 -0700 (PDT)
Received: from localhost (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id v64sm3894419pfb.20.2020.05.09.00.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 00:48:19 -0700 (PDT)
Date: Sat, 09 May 2020 17:48:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 04/16] powerpc/64s/exceptions: machine check reconcile
 irq state
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20200508043408.886394-1-npiggin@gmail.com>
 <20200508043408.886394-5-npiggin@gmail.com>
 <878si2czrc.fsf@mpe.ellerman.id.au>
In-Reply-To: <878si2czrc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1589010414.5tkveztwwh.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of May 8, 2020 11:39 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> pseries fwnmi machine check code pops the soft-irq checks in rtas_call
>> (after the previous patch to remove rtas_token from this call path).
>              ^
>              I changed this to "next" which I think is what you meant?

Yes I rearranged them, so yes.

Thanks,
Nick

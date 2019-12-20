Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 267381274EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 06:11:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fH0T1V0nzDqvH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 16:11:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tJfYnPIW"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fGy506fmzDqDZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 16:09:32 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id c22so10254463otj.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 21:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7u/dOifnUzmw3NIVXmeXQ6PtZtbzvgtFMLnZaOR2oeM=;
 b=tJfYnPIWxTpKDMXDaHaS8IAUnVOmMI54z0UcX05QPapIBURFtvmgTyTHsL8GUlb9d4
 O7lf6z7QW0baziRHCuRAPlhuF59JyQzFzwambf/8gXJgM4jOTrCz+nfDtQIrE8S+xUaF
 UJMOVI9F1s3+64NRYCmTIsLG9oieD163C9CUC5/K33xssIWiSTxwtLFlreRce3ds6Ao/
 HHxq1QjHilkQ71l/l6bwyAPrWELqiNXWF/QJk6RTraV0oTGabeQ1d84hCYChmffqdWOQ
 gIHC9FUN8HqPYgZPzHY+nUMkc/IHEx2GZIuNgUxwjYROgdRU4pI5fRwLNoz6YCeYCNHF
 y64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7u/dOifnUzmw3NIVXmeXQ6PtZtbzvgtFMLnZaOR2oeM=;
 b=p1NkURdjwd7H6WemITqp4yIyhdTQdkETm823ipQ3+ZKr+/0TPbnlpRs528nFihs9d7
 y4FYWD+mqDElvjjUqccYbPgH3dlSr1REROE/HkzzvCRlVw6CNvXFpTfnfh769dwZDEJ9
 AV9sO65A7X9WF/ZulMuOigluPsAQQtOdqqkGigzPkvtpegxfz63fNJ5yfRv8YGqkk+YY
 MkJ5bObF1cly2suo5bf6CBxNL9bLf+cAoltfTBZkOC+6u5YqXYbodXN6HaqqzRL58Qwr
 r3Ti+C13vystWPV8uk4TYD1McboZ6tNIzQq3AgFne9RCUgixzmaktWg2JMbNYWyB62Wu
 XLIA==
X-Gm-Message-State: APjAAAXlLswkAeeb4UV+Oaz6qDQslnVM9LkHhnLjAgFxQePLNGoHlkOc
 j6DAw+SuiLRIBiQun3mpnI/HqaOvJiANOF4rX4gD2w==
X-Google-Smtp-Source: APXvYqwNVIYCtXLPc5+cdKMNrjsbiBVzy8+cwUP3wgVqKMtxZhe2PwdjHIulAle5gKcG1rV+XR2VeFxKjivi8Gz1Z9s=
X-Received: by 2002:a9d:6d10:: with SMTP id o16mr13304281otp.28.1576818569435; 
 Thu, 19 Dec 2019 21:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-4-jniethe5@gmail.com>
 <87v9qet53k.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87v9qet53k.fsf@dja-thinkpad.axtens.net>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 20 Dec 2019 16:09:17 +1100
Message-ID: <CACzsE9ruk3D7x-ESfvGU-S0M0fy91pWh_HEn7j6o4bPjBZE0tw@mail.gmail.com>
Subject: Re: [PATCH 03/18] powerpc: Add PREFIXED SRR1 bit for future ISA
 version
To: Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 18, 2019 at 7:23 PM Daniel Axtens <dja@axtens.net> wrote:
>
> Jordan Niethe <jniethe5@gmail.com> writes:
>
> > Add the bit definition for exceptions caused by prefixed instructions.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >  arch/powerpc/include/asm/reg.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> > index 6f9fcc3d4c82..0a6d39fb4769 100644
> > --- a/arch/powerpc/include/asm/reg.h
> > +++ b/arch/powerpc/include/asm/reg.h
> > @@ -778,6 +778,7 @@
> >
> >  #define   SRR1_MCE_MCP               0x00080000 /* Machine check signal caused interrupt */
> >  #define   SRR1_BOUNDARY              0x10000000 /* Prefixed instruction crosses 64-byte boundary */
> > +#define   SRR1_PREFIXED              0x20000000 /* Exception caused by prefixed instruction */
>
> You could probably squash this with the previous patch, and maybe the
> next patch too.
>
> Regards,
> Daniel
>
> >
> >  #define SPRN_HSRR0   0x13A   /* Save/Restore Register 0 */
> >  #define SPRN_HSRR1   0x13B   /* Save/Restore Register 1 */
> > --
> > 2.20.1
Thanks, good idea.

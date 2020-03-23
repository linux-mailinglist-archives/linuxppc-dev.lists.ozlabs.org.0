Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1F18EE15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 03:50:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lzQJ6LKXzDqTR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 13:50:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Yae682IE; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lzN20npdzDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 13:48:32 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id mj6so5476372pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 19:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=MejgEVzKm5NsWrT3nEPO4wUVyl7zKSPGNazl/RWRXfY=;
 b=Yae682IEnSWT8g8P1rgvsOtUQJ/WWrw/E33/BtTCDRQwPYRaxDk/PEZYGRKGW5NQGf
 EjzO656XWl6zdihKmoBgerkPDkec5SAihEK6KTDMYp4cbVFeyvnpiFfHxQMlY4jUS/2G
 lGbM8/+0/yL73aJkH6Ic7hKDdZDeG08OVarPbtizap7HiEy6140INdiL3gb8Gi5pjdv9
 pWa049MaiT4yBLwQXeUgPpL1Xk0pU0AAMyN3En0SNE1SREeJ+yAawlUqka2ehVb82/K1
 paFTv9XqmY4S844vQ12iMVy2WOukfp1vEMNYIQcztiZBW+u8BlQQ50Kb6km8bpN1EKhu
 NMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=MejgEVzKm5NsWrT3nEPO4wUVyl7zKSPGNazl/RWRXfY=;
 b=tYLzcyIABaMDH0iBG/Bt51O2F8zJNSwCMaS02S04PMBHuJ/8yATUHiT6QAofeleJ69
 Myd/lsxHCBh2ZeRC7PpYG0CebEy7SeMDmc+nwBuk4IsZrrcz6xMRiofgGwUh1gU6k/se
 Y3YCX5qrAlVJcNaXIKR8SxRMpMbAIYMWPkBe/0q2phiLGIzprFUi7eiVaBY4vp7pUmxf
 kqSVeL/CvAFM0rV/u2xYNeDLajnJwpbmRHqrxhkOmdiDdQpk4LdZ/eQ9dTiH2YoL9QcI
 qsySSqvuwuQzXhE8Sc2FzewqDwd1I8v9mAQpIqW7vY4Bb0Xh9BLKcqkrf4uAeRp+GF6U
 eiZA==
X-Gm-Message-State: ANhLgQ0I3tlGqQFnxJeIEaqVbakDs/yw1SnO4P9UG3D51hGReYFeGRCP
 w2OLC+AA2k5se/JqL2LWEmM=
X-Google-Smtp-Source: ADFU+vveHbKSBWjEz1tID/N19cLpPAHF0CxISgVmDCmynW/PUpUluiPmIEPZmteoSc4tjz9Gpb6h0Q==
X-Received: by 2002:a17:902:a416:: with SMTP id
 p22mr20001793plq.57.1584931709956; 
 Sun, 22 Mar 2020 19:48:29 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id u14sm10683912pgg.67.2020.03.22.19.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 19:48:29 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:44:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v8 12/14] powerpc/vas: Return credits after handling fault
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598755.9256.15264.camel@hbabu-laptop>
In-Reply-To: <1584598755.9256.15264.camel@hbabu-laptop>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584931224.oij3nwbo4z.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, hch@infradead.org, oohall@gmail.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni's on March 19, 2020 4:19 pm:
>=20
> NX expects OS to return credit for send window after processing each
> fault. Also credit has to be returned even for fault window.

And this should be merged in the fault handler function.

>=20
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/vas-fault.c  |  9 +++++++++
>  arch/powerpc/platforms/powernv/vas-window.c | 17 +++++++++++++++++
>  arch/powerpc/platforms/powernv/vas.h        |  1 +
>  3 files changed, 27 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/pl=
atforms/powernv/vas-fault.c
> index 40e1de4..292f7ba 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -238,6 +238,10 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
>  		memcpy(crb, fifo, CRB_SIZE);
>  		entry->stamp.nx.pswid =3D cpu_to_be32(FIFO_INVALID_ENTRY);
>  		entry->ccw |=3D cpu_to_be32(CCW0_INVALID);
> +		/*
> +		 * Return credit for the fault window.
> +		 */

None of the comments in this patch are useful.

> +		vas_return_credit(vinst->fault_win, 0);

Can you use true/false for bools?

>  		mutex_unlock(&vinst->mutex);
> =20
>  		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d\n",
> @@ -267,6 +271,11 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
>  		}
> =20
>  		update_csb(window, crb);
> +		/*
> +		 * Return credit for send window after processing
> +		 * fault CRB.
> +		 */

Any chance of a little bit of explanation how the credit system works?
Or is it in the code somewhere already?

I don't suppose there is a chance to batch credit updates with multiple
faults? (maybe the MMIO is insignificant)

> +		vas_return_credit(window, 1);
>  	} while (true);
>  }
> =20

Thanks,
Nick
=

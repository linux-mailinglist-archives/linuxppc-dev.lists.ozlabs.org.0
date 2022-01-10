Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B984A4891B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 08:36:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXQd24zj0z3Wtp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 18:36:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bt7E76FD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Bt7E76FD; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXQcM53Msz2xTC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 18:36:17 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id y9so10422219pgr.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jan 2022 23:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6yomU4+mzGXo6Rwy8oGn/mAJJAsCmpMu41OyX2klM60=;
 b=Bt7E76FDwlkds6LdDSdQV6M5uQeTkKYu88f+topooyVx9jfG3jhW1dgNBj+hZlqFqY
 xygj19gZKG2b5WWanbAyhYDNwjw230o8zrIz8MLm8xupOj4OcH+NUDTppAxmf4oo+RPZ
 ROk42Pzq8RbHey+NPmPNTgXIItLilv5oVhpnOS7/8aEBVLWxXSpmYzISASOQgePlXMua
 Rj1D+9ADECwKLz9MJe4JwA6AC5cL509Qr7l/wXATYoMBkNXaFUxQHk9YzoV/b9MkuRTd
 FrNsmcPh+qVDBGnZStl2T8W6VzNtXyXS7XriglDQve0qMBCf61pVGDB86TzOTWxx+AxT
 k9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6yomU4+mzGXo6Rwy8oGn/mAJJAsCmpMu41OyX2klM60=;
 b=MGfVs57GBv2HjU38UXa87SmKK7sJSVoMGXPRTO1WWs2R2CnOlDbHyPUOS2PhRUzzDm
 /uuUHDbCclHS3fU5mZvmqUyzkehgzgZOwZbugFByLGC0OBjwJdH0KGjuqtauMZVELdGM
 7uk99k8b1731kzizcjmgIdCWyJq+wRaItId29EMfWcNg4FsTjlWuucslOFpcKxfFDAIa
 5Sch0iyK3xMUC9qwxyUmkKyky9+orcb5QggnZIdpvtkzZL6DCqxqxLLvmShk4p8veifo
 DiYgStiqZEJLHSogUbhBeXdRCzzZ+eicJMeBY9ChDG9YBzWBw0sA3mdBqPqwttDeAIxQ
 oGGQ==
X-Gm-Message-State: AOAM533ffzbuvk5MX2jrgD69twhXsUeg12WG3ms7+W8o5OQ4ELcb2BPX
 FYgNshN37KkJTBNRYuhHK+g=
X-Google-Smtp-Source: ABdhPJwk/5cHvvmIUIZObJftZ/3y5xd1JU2AnqLUOTHQHICnW/lomFDaMXgZKhpuh0eIZwX+SGI/og==
X-Received: by 2002:a63:3341:: with SMTP id z62mr56493253pgz.99.1641800172528; 
 Sun, 09 Jan 2022 23:36:12 -0800 (PST)
Received: from localhost (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id c11sm6064062pfv.85.2022.01.09.23.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:36:12 -0800 (PST)
Date: Mon, 10 Jan 2022 17:36:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 5/6] KVM: PPC: mmio: Return to guest after emulation
 failure
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220107210012.4091153-1-farosas@linux.ibm.com>
 <20220107210012.4091153-6-farosas@linux.ibm.com>
In-Reply-To: <20220107210012.4091153-6-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1641799578.6dxlxsaaos.astroid@bobo.none>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of January 8, 2022 7:00 am:
> If MMIO emulation fails we don't want to crash the whole guest by
> returning to userspace.
>=20
> The original commit bbf45ba57eae ("KVM: ppc: PowerPC 440 KVM
> implementation") added a todo:
>=20
>   /* XXX Deliver Program interrupt to guest. */
>=20
> and later the commit d69614a295ae ("KVM: PPC: Separate loadstore
> emulation from priv emulation") added the Program interrupt injection
> but in another file, so I'm assuming it was missed that this block
> needed to be altered.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/kvm/powerpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 6daeea4a7de1..56b0faab7a5f 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -309,7 +309,7 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
>  		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
>  		kvmppc_core_queue_program(vcpu, 0);
>  		pr_info("%s: emulation failed (%08x)\n", __func__, last_inst);
> -		r =3D RESUME_HOST;
> +		r =3D RESUME_GUEST;

So at this point can the pr_info just go away?

I wonder if this shouldn't be a DSI rather than a program check.=20
DSI with DSISR[37] looks a bit more expected. Not that Linux
probably does much with it but at least it would give a SIGBUS
rather than SIGILL.

Thanks,
Nick

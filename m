Return-Path: <linuxppc-dev+bounces-14369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3667C70E9F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 20:56:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBXKc1v1jz3dKm;
	Thu, 20 Nov 2025 06:56:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763582164;
	cv=none; b=jFH88A3S9Y4gVgeJflHOn/IYXQQi4mi3Cww7rF4YfC6hYOWTMnQ//3TXXZPe2U3PlgU18QMQ2/QaexmbY1oV6Qr5DFtLj0ZvXAtFZdmKDBrIsi110vowZPU1wcZhldd8jiacn0VvoW6D/D10SnQMwvPg0s/G12x8y/7f5tY3/oKmT/eiEXwp1YVofObjYyppiK3ur6JMgCxabBSIoultjP1ap1LcsCUvZQejgpjgCzd/9Q0jyE4EQUpzlPLrgNNRnUEh+gT7IfobidiA7NM6siMWrWwNRJiieF3S98DzL/971VX7aQyR9+Ep8OG7y5rhXybTTVf4HPDARGUGNTkAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763582164; c=relaxed/relaxed;
	bh=DN/DzA6q+86ev6MGPfAT+dLF+J2Uxfsbiqindp3jA1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJGA6shIAzkSpzvQSkJj5n6nqUYo5krK5CA8iFZthtPSNZ7VzEfUYbo5EDjeaYC+Fdpqrc3jUhaZieY9vFO9u8luSoTCuiPF64crUnU1T+SJrEKNWI1TiLCHLo954cbLVpke8LQV8omoFkhztPMYu/LXEdNr9rGWox4bYsGtEu9PTxTTljq/rQbIhM415gffwiFR9UAQ5QTYKVkZaD1hV35k3eH8GIE43PCtjbagPKFCBRvlNDHTU583kqQWKf4Lj5jq3wvsCHuUqCIX1ZPQpvfzfD5PRmjBZfarXry/+M9FWJA48K3ezx1dpM0jjQQGXpZO4zuSAzD9NOuGPGBm+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=XTbDClOX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=XTbDClOX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBXKb03LLz3dJq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Nov 2025 06:56:01 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-29812589890so1403025ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 11:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1763582159; x=1764186959; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DN/DzA6q+86ev6MGPfAT+dLF+J2Uxfsbiqindp3jA1o=;
        b=XTbDClOXZA2c+Dp5VqRi/LLIZAbXt5rVXv/JlcZ6dFbgV2XIwq1VR4PnKlCXTO6hAf
         CIw0YOldgDeEM2IlUDYr1IPvgxXwLJaaOjqLwbuQsnhBEARfVmf0wLKnD0iDJho/dd5e
         1aqAb3UWSBH5wD+fjspW8MGVNodby0UbIkNSf7CADpnyiKkHnNL0Amr1JZ3Szb7Jt7zm
         lV960kKnS3j0D7etFyoXTY0LhSJWZanfEComWpUOKuq+D0SKL+gyN/31bEj+HBtZlzHJ
         EabWE7CByloLDgg2/P0gT3iG5Lb5+01ECcKn8e+2vWoSa1N1p4pd8MDLCr4RLRFimk5o
         y1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763582159; x=1764186959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DN/DzA6q+86ev6MGPfAT+dLF+J2Uxfsbiqindp3jA1o=;
        b=s0cbnNLfGujhuPvwy3r4TE8DYIidkR4UyAMHycN5NL/mOqZ7J5pIWiWlIRnFOj8K3u
         1+chav2bhShRnjcPNk7Hn/sTxxOB18fM8hz78wCeAjpSWkhuZL/lRwzeZZjb7YbQRgZS
         mhBMr/jpcCBY1djWNIvQeYTSO1yGlODZ2VSrLkq0ssny0Uny/9rk96sdtSo2bYNmL6qE
         Zb3N1YYu3nVDAMkRczKw1pdE+lOiAgfwKXzeGEwC4B6x3if8AGHa1k8gJg4Vh8s2foe3
         74n3sQ9QRMzlIl8ClKCGT82Z9bZGQhuGPFTqsXgyNx3RwkH0NJRunihte18g9rMYWUl9
         HSWQ==
X-Forwarded-Encrypted: i=1; AJvYcCViGstzIArhk/CtFjHvDLaUJ/wBcHja8zngOG3+Tx/kONV/XEd6OMhnnB0ipjA5iZcn7SMDuGFf26spZlc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw8wgcrh9qQWdU4p04+Ok4CnhshYmLF5zt48coXnKe2cgvfsRx9
	h9J0H5jpvkvRT9sQlQkEecfykedg/KR93pR43Rez2HgipQw0mgFQaMgyh/+5xArC6lV/iktUR4E
	APLHkvRyiTG6HbzW3SUOLWY63gyN/zs09wp1M1IzO
X-Gm-Gg: ASbGncthnExw+eotnpIGfrWu9yWtBPV8cPJrzXLwZuvx7rULfMnLSKHl9JVOl8BHqen
	zTfUbxT1n7a8Zfj49pdqt79Vjb/T6nSVkqz6cue2CR0XMkx0mRW2Srhn8S3AZNgiefM4+LwgQHf
	oJuMu8ou9pu008n4g4RnVOHVJqytDc8iCWb6rNjua3Pdm9QAPNyyY/ikmhV7K3/61PUMIFKJ9qP
	CEZP7rpgRhPtzHzBXTrxyyAgVoSqmeRThHffHkgFjh0TBfJvBJhCEjUHKf3b42yXGVCB6M=
X-Google-Smtp-Source: AGHT+IFH9MSHfJWp6YXFB42UsuMhoLOkEWsFTDtMBAdcLCsEfu9ycctu3VPOXdyMN2njeOgrz0I5tCYbRs8o2VLROfk=
X-Received: by 2002:a17:903:19cd:b0:295:a1a5:baf7 with SMTP id
 d9443c01a7336-29b5b0d7f17mr6451945ad.37.1763582159025; Wed, 19 Nov 2025
 11:55:59 -0800 (PST)
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
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
 <20250429-module-hashes-v3-7-00e9258def9e@weissschuh.net> <20251119112055.W1l5FOxc@linutronix.de>
In-Reply-To: <20251119112055.W1l5FOxc@linutronix.de>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 19 Nov 2025 14:55:47 -0500
X-Gm-Features: AWmQ_bn1L21n_pWrZnJvXRwL1Z-01d6qlYWdrkllcBBpENXLHykDJ3f6oq3wlNk
Message-ID: <CAHC9VhTuf1u4B3uybZxdojcmz5sFG+_JHUCC=C0N=9gFDmurHg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] module: Move lockdown check into generic module loader
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>, 
	Christian Heusel <christian@heusel.eu>, =?UTF-8?Q?C=C3=A2ju_Mihai=2DDrosi?= <mcaju95@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 19, 2025 at 6:20=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> On 2025-04-29 15:04:34 [+0200], Thomas Wei=C3=9Fschuh wrote:
> > The lockdown check buried in module_sig_check() will not compose well
> > with the introduction of hash-based module validation.
>
> An explanation of why would be nice.

/me shrugs

I thought the explanation was sufficient.

> > Move it into module_integrity_check() which will work better.
> >
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

--=20
paul-moore.com


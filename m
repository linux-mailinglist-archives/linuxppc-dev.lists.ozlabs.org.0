Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4297173180
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 08:01:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TL6f0ZV2zDrCT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 18:01:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=b7Eu1OiV; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TL4n5pxMzDq77
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 17:59:37 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id ff2so896376qvb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 22:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6hyoD8zfmHfdvTYAWzSR1LNa/TqLChPyCgM+JY7rNU=;
 b=b7Eu1OiVC2aJps+SPPzuhzjoMER1rqPqa/VvZX29dIM7lR539TlgLa+v3GMZHBRQAZ
 eKx85GB9ht9NaHJX6T/qVdHk4UDIucXgAZ6/aTIRLJejLwfsNbAR9Vmt7SJ502TZP55S
 vEcKJZJKg3jJMQS7ipLyZjqQ8/4Lu6AuWQH60NG0cRLgtElo+6LZM3G144uugbn3JbGw
 aN1TMFE54ow0CXGU/EKnklzGqnXqBKBifIDgNq9Kwdebmqj94szrMo2DFayQGYxP6Nqi
 QjRJlEYjd9OZA88814HnrlYzMwEvul1UBw6wj8PovvjrQe6Y5v7z18EmT/zb+a0ydbDW
 DuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6hyoD8zfmHfdvTYAWzSR1LNa/TqLChPyCgM+JY7rNU=;
 b=dnFcEHdo7zbV7KQzPIyNh8IULHjLU81S7Uj1V36HOuL3jMgJZfBLR81r8di1fy1c4O
 dsxU111P/D6RH2osMKpPaRWBoPuMBYNGWe+fbYaydoq7pniypjOcAm1fmq3yAm+tfn+T
 jyJhB2UsnWenj5qAUcQWVBq0IsEG1WO76se28aHAAR5r///ZyvtODeoqgs3CSiuARLmh
 lQrO6T+bEdpwSNUd7xpGkyXnr8O7krMfyGOQnAWxnyIOzQbmujwuBQHxqOZ+3NnKtrNl
 TRlojF29pAl9CEzeOdeXpZ0OaCvshIUwPujHLdhIu1PX+Ht4gVAydLJFufAQuyFJjMyu
 w3Vg==
X-Gm-Message-State: APjAAAUs1BDh7Zp/fkqNAibTCbmzhhUZbqaqRGZaR7CxvQ/KMm5jR4nG
 ClujfJ1jZhrPSIU1upDTSH91No2YdyHrVRG80fs=
X-Google-Smtp-Source: APXvYqx4Mglpr2YgBhx2B/bWVdjJWIXLSKGQv1V/Zpmwn53wJsLruUiOcUOlVokZfkaeflXerQVi8nrguOcbktfRu5Y=
X-Received: by 2002:ad4:52eb:: with SMTP id p11mr2292548qvu.211.1582873174403; 
 Thu, 27 Feb 2020 22:59:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
 <d9aebf5ef9a92623db10dc537161b3ecdb1d8b18.1582770784.git.shengjiu.wang@nxp.com>
 <20200227183926.GA456@NICOLINC-LT.nvidia.com>
In-Reply-To: <20200227183926.GA456@NICOLINC-LT.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Feb 2020 14:59:23 +0800
Message-ID: <CAA+D8ANFN9irpX25VnKYDm3cfU16ht7bcB4-zjDOyHMj8NM9Qw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
To: Nicolin Chen <nicoleotsuka@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2020 at 2:41 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Feb 27, 2020 at 10:41:56AM +0800, Shengjiu Wang wrote:
> > There is a new ASRC included in i.MX serial platform, there
> > are some common definition can be shared with each other.
> > So move the common definition to a separate header file.
> >
> > And add fsl_asrc_pair_internal and fsl_asrc_internal for
> > the variable specific for the module, which can be used
> > internally.
>
> I think we can just call it "priv", instead of "internal", since
> it's passed by the "void *private" pointer.
>
> And it'd be nicer to have an extra preparational patch to rename
> existing "struct fsl_asrc *asrc_priv" to "struct fsl_asrc *asrc".
>
> Something like:
> struct fsl_asrc *asrc = yyyy;
> struct fsl_asrc_pair *pair = xxxx;
> struct fsl_asrc_priv *asrc_priv = asrc->private;
> struct fsl_asrc_pair_priv *pair_priv = pair->private;
>
> Thanks
> ------
>
ok, will change it.

best regards
wang shengjiu

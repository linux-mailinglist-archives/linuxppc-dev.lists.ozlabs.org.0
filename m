Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BFE1FA2AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 23:20:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m44G1szTzDqjM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 07:20:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=2GB7LupH; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m42G6hPhzDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 07:18:46 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id h22so451200pjf.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=K+cMiKrRga91vCTBmD8D5XGxUlsSQ1EKO7QoeTvwQ14=;
 b=2GB7LupHwlZ6MZtJPWSNxp3apFXotPM40suzbHcMbHpAtfxMDlfoT68CSyoFNL8a5W
 Z0tAhownZcTP8TRk6IoslRw8BJAf1OXzJREAwoj7wWd3V14OSBwEBVF70E7hminRlU56
 2VsxRj20OP0xyXqNS18gd25MtW6DEU2un5q7P64tYWB4Fs7qzeb27Scj4voailQZlsxX
 kibSCzCnlI3uAzFI7DH/O+JIlSgCq0aVl2WDsd7HhTrTfAWwnO/iAvwlYH/1TAJRTivU
 y1ZhI4gCO2NoAYrkyYozZCRaczRqz8a/Xr9GEbYWOyr3GPdZ6rbRamLSMm4DX8QTnYXG
 f0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=K+cMiKrRga91vCTBmD8D5XGxUlsSQ1EKO7QoeTvwQ14=;
 b=mQ4oL9mPHHIq2lUNDaJHtljpFi+HBrgEDCLRUy0pkmpoURJ/Xc4iNMpRxdO9Pm6JMG
 NDXwRFjHalRDekE1bIacqx4VXcFhyG0rd4yEMswFpjzhbwPqsnLnp//P2lzFC9qIxUoe
 0SrNIRRrizPxOE0eXp62u4zvxCoKO2ITgZnS9hSJucdY+J1EFvfv3AGv6MOAEZhRe/xB
 my6/wcq+R7g/NSWN64pL/ZJSlovzvtugg/ePEUFNNGrs64S22lMlWYaSQ38o2nxLOCNe
 oKFFLOlCpremyLgrZ3ssGJs/4Gx/uOeZ0ajet14Y6OuImTFShz+SpUvNmZyQIloirUWk
 ghEw==
X-Gm-Message-State: AOAM531wynNhTKkIhZMvRYhqgUiI7RIWc8QbyVQLJ+w77jeDYt5UJI3D
 ta8Vp22NpRg4ppNGgxcYxPiUeg==
X-Google-Smtp-Source: ABdhPJyk8XIeff9RCB4w5FuIJDrmQLNmbSUdiTI79aWKrOQ2lLPVa5D7eCOAxgksAA4QZIZRamSHVA==
X-Received: by 2002:a17:90a:e509:: with SMTP id
 t9mr1153242pjy.189.1592255922875; 
 Mon, 15 Jun 2020 14:18:42 -0700 (PDT)
Received: from ?IPv6:2601:646:c200:1ef2:d2f:b9d:749:9ce5?
 ([2601:646:c200:1ef2:d2f:b9d:749:9ce5])
 by smtp.gmail.com with ESMTPSA id g65sm14766552pfb.61.2020.06.15.14.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 14:18:42 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Date: Mon, 15 Jun 2020 14:18:39 -0700
Message-Id: <E39A5DE2-5615-41FF-9953-4F4C4E8499D8@amacapital.net>
References: <3908561D78D1C84285E8C5FCA982C28F7F66C849@ORSMSX115.amr.corp.intel.com>
In-Reply-To: <3908561D78D1C84285E8C5FCA982C28F7F66C849@ORSMSX115.amr.corp.intel.com>
To: "Luck, Tony" <tony.luck@intel.com>
X-Mailer: iPhone Mail (17F80)
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
Cc: "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, "Hansen, Dave" <dave.hansen@intel.com>,
 H Peter Anvin <hpa@zytor.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>,
 x86 <x86@kernel.org>, amd-gfx <amd-gfx@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, "Yu, Fenghua" <fenghua.yu@intel.com>, "Yu,
 Yu-cheng" <yu-cheng.yu@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, "Mehta, Sohil" <sohil.mehta@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jun 15, 2020, at 1:56 PM, Luck, Tony <tony.luck@intel.com> wrote:
>=20
> =EF=BB=BF
>>=20
>> Are we planning to keep PASID live once a task has used it once or are we=
 going to swap it lazily?  If the latter, a percpu variable might be better.=

>=20
> Current plan is "touch it once and the task owns it until exit(2)"
>=20
> Maybe someday in the future when we have data on how applications
> actually use accelerators we could look at something more complex
> if usage patterns look like it would be beneficial.
>=20
>=20

So what=E2=80=99s the RDMSR for?  Surely you
have some state somewhere that says =E2=80=9Cthis task has a PASID.=E2=80=9D=
  Can=E2=80=99t you just make sure that stays in sync with the MSR?  Then, o=
n #GP, if the task already has a PASID, you know the MSR is set.=

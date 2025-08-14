Return-Path: <linuxppc-dev+bounces-10965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 264CCB2585D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 02:30:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2R3T5f51z30TM;
	Thu, 14 Aug 2025 10:30:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755131429;
	cv=none; b=UgODAHNYMHlZUmnIO2Q30UQMRDXP74NkAVU4S4pjO9tH6DYw/2UTRocoDZmm/0zSivgZzlBDUAJ/ha+oMWDLEq4W6Q1xGBqm+YQcM3Cd0XSpo3+D0IYrV2zm5ZHevReJm7731FtI9PvXKIv5v+/I2AyDPrVZ8oprM7IpYpvutauY8EC+f6QBuSaGXBWN8iAplcyM+Blrmzwqs07zAAdQVi5rjdtFY7eOgrLWsPC/jDRWzbvEpc45cob+X9e6eAQcCISxiBnutZ60lRTOhvaZoGNc9r8XlCa2pIIGJeZ6ZIEeFZ8ZpX+IqRe6KHOr4HXTq0hE75vRVcSHDWZqP4FzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755131429; c=relaxed/relaxed;
	bh=BlCvnOQctLd/+WDVBQmTo0WOxMHirEzzfWhXA87C2eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGoEaEgnbAYpK0J+lTJmkTCnMdtQp+N2Gs7mLoLUMgIf0iV8KLbbNSYzsBsHKS9CpbmJRu4MBG/nnmI0pFLRmSDtW3kO+LHZDt5Nqd5J4BIWJYWbc4S9iAmurSWtQdo92PpndbdTL0mLDiG2+YU1eemXJfVPimYZ0u5eOxLlQHoiW0ONISNo387Cxb9pu54m1pTg0lArY3FEibjJj0gQsuE06s3Zbv5RBXlpEdcL7uut1muxOhPgMKU4YOmilT4Yja6EgHx+KO4X2iyZW31N8FFTvBOg90aTjnLwsffWIn0CP3gApVXzpArnPuZeYEHGxL/EyNBgpCOx7JcN4t5nFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JkQMJ48Z; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com; envelope-from=linasvepstas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JkQMJ48Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com; envelope-from=linasvepstas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2R3S6yL1z30Sy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 10:30:28 +1000 (AEST)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-30cceaaecd8so164970fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 17:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755131426; x=1755736226; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BlCvnOQctLd/+WDVBQmTo0WOxMHirEzzfWhXA87C2eg=;
        b=JkQMJ48ZAc1E8nETX06LaJKDxZuqyvTzTmxcasLBmu2lMqIZpqLb2kLzIraqodzqwY
         amDvhgsZKW9cYcVAutC2KuJOJ2VCPNHUQHG+hm5NtBrCG912zECFXSMPTh0CskIct8Yx
         kS8yMWm1QHs1v8gm5LRHNu8XQc1P9+wHb/Uohl/ZGM2WXgN9VRY9DGyAj6RNHvGlB3/2
         ich0BtLkLXGwoaHIE0Vy7sK9rpxW8ZfJ7wGZyvHhvBAA3+zr7CYLen4BsguVB/Gkl5bZ
         PJHSXm39KxgKDaf1CNMbdECaE9NdMforfJ/Q49c+BxMZifHiTiCMdmKQP8C/dpcmEh45
         6qZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755131426; x=1755736226;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlCvnOQctLd/+WDVBQmTo0WOxMHirEzzfWhXA87C2eg=;
        b=CNouAGH79n5oY++8+SyzY+7iKn6AXKSeC9158MUhJ7tPNQaO76unppiZs1QuLL7u6+
         klPOlu34xuTevyK9n226qS7P6EhYtli3+NtrcOM3C/xVPV+TH60ThxeCZ8gousj7QDAy
         u59dWWIiuOMTHS3E9Vy1MnpptL2DnMWA+xuZkeC47DJXi/dHe6WE4AlGehUWQ/FWHwr6
         VVxwhtveLMsd6c3V6JP7z0sWmTp0Jb2AqMudOmAt2SLBdskxYTk/MUTImMIjSuKjpUDn
         Et3PmLg6hRl8s/mo5ceV6+yGukHiKom17E18mubwb3rVdktwj4H4aim269piuXvnZU31
         zk4g==
X-Forwarded-Encrypted: i=1; AJvYcCWSAJjWsNeC6P1U7pIqD3ZAXkctM6vGGlDeI4wcneS6fKYbQumC6Dw42HMPtRvh8B5Vuz9Nm17vaW/vTxI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9BPzzaqHDMfLUYzR3U+cvWuiv+m4/AvwU8KjkN/roJdmtnk6a
	IHugS54mm8UVcYmarGk8qDudUFAJUejnzwVkWAhDFPjQUaLlAKLUb4zZSkXwgwX851ZMip/EO2s
	+6Elf9pHvhrCs5YBVehyFL4hq1C8Gv24=
X-Gm-Gg: ASbGncsfushoyBgwBLjd+NUItC4HlMbt8IKDPzzRRxgXw4Jk8z2Q8ya8ZTWzSGBIprk
	QoOIGEYG/083mn6g/Q9IyUgU3RkjekPkmhqmMwiQMiNuDqITZQ4/lQgVkrD7LF/V8KGEt159GLM
	R2CUB3cdEI7DryzkVDDo04/oJPMpHF2jiq54uRIBz9063zMV82aCDjbUQP03Y5pIYVdaBYaA5mF
	IZl0A==
X-Google-Smtp-Source: AGHT+IEbWRTSBuOYeeoAr9bKy1UQ6rnS/Kyyy4nFD6ljr+lBlBotQlXVzUZZguvVbNcmYuDePTXobqR2QR9chL3wUOs=
X-Received: by 2002:a05:6808:17a4:b0:402:18a1:843f with SMTP id
 5614622812f47-435df7f8108mr786004b6e.32.1755131425843; Wed, 13 Aug 2025
 17:30:25 -0700 (PDT)
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
References: <cover.1755008151.git.lukas@wunner.de>
In-Reply-To: <cover.1755008151.git.lukas@wunner.de>
Reply-To: linasvepstas@gmail.com
From: Linas Vepstas <linasvepstas@gmail.com>
Date: Wed, 13 Aug 2025 19:30:14 -0500
X-Gm-Features: Ac12FXxx7JOXt2R6Mwt1m1mshgZ-FezFJtAHN_Q20N-4qkbgN5MFLcN6Fv71Xr4
Message-ID: <CAHrUA34fVV48MShC4CrXSmveR9i8MC4KAQxtM+XQY_Ao8joBQw@mail.gmail.com>
Subject: Re: [PATCH 0/5] PCI: Reduce AER / EEH deviations
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Riana Tauro <riana.tauro@intel.com>, 
	Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, 
	"Sean C. Dardis" <sean.c.dardis@intel.com>, Terry Bowman <terry.bowman@amd.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver OHalloran <oohall@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, Shahed Shaikh <shshaikh@marvell.com>, 
	Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, 
	Edward Cree <ecree.xilinx@gmail.com>, linux-net-drivers@amd.com, 
	James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000002bf012063c486118"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000002bf012063c486118
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW
Reviewed-by: Linas Vepstas <linasvepstas@gmail.com>

*** Notes: I wrote the original EEH handler, and three or four ethernet and
scsi EEH recovery drivers (including lpfc and qla, if I recall correctly).
I've been inactive in kernel development for more than a decade; I did read
this patch series (carefully); it seems excellent, from my rather distant
viewpoint. My apologies if this email feels like noise to anyone on the cc
list; I feel obliged to respond. -- Linas

On Wed, Aug 13, 2025 at 12:11=E2=80=AFAM Lukas Wunner <lukas@wunner.de> wro=
te:

> The kernel supports three different PCI error recovery mechanisms:
>
> * AER per PCIe r7.0 sec 6.2 (drivers/pci/pcie/aer.c + err.c)
> * EEH on PowerPC (arch/powerpc/kernel/eeh_driver.c)
> * zPCI on s390 (arch/s390/pci/pci_event.c)
>
> In theory, they should all follow Documentation/PCI/pci-error-recovery.rs=
t
> to afford uniform behavior to drivers across platforms.
>
> In practice, there are deviations which this series seeks to reduce.
>
> One particular pain point is AER not allowing drivers to opt in to a
> Bus Reset on Non-Fatal Errors (patch [1/5]).  EEH allows this and the
> "xe" graphics driver would like to take advantage of it on AER-capable
> platforms.  Patches [2/5] to [4/5] address various other deviations,
> while patch [5/5] cleans up old gunk in code comments.
>
> I've gone through all drivers implementing pci_error_handlers to ascertai=
n
> that no regressions are introduced by these changes.  Nevertheless furthe=
r
> reviewing and testing would be appreciated to raise the confidence.
> Thanks!
>
> Lukas Wunner (5):
>   PCI/AER: Allow drivers to opt in to Bus Reset on Non-Fatal Errors
>   PCI/ERR: Fix uevent on failure to recover
>   PCI/ERR: Notify drivers on failure to recover
>   PCI/ERR: Update device error_state already after reset
>   PCI/ERR: Remove remnants of .link_reset() callback
>
>  .../ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c   |  1 -
>  .../net/ethernet/qlogic/qlcnic/qlcnic_main.c  |  2 -
>  drivers/net/ethernet/sfc/efx_common.c         |  3 --
>  drivers/net/ethernet/sfc/falcon/efx.c         |  3 --
>  drivers/net/ethernet/sfc/siena/efx_common.c   |  3 --
>  drivers/pci/pcie/err.c                        | 40 ++++++++++++++-----
>  drivers/scsi/lpfc/lpfc_init.c                 |  2 +-
>  drivers/scsi/qla2xxx/qla_os.c                 |  5 ---
>  8 files changed, 32 insertions(+), 27 deletions(-)
>
> --
> 2.47.2
>
>

--=20
Patrick: Are they laughing at us?
Sponge Bob: No, Patrick, they are laughing next to us.

--0000000000002bf012063c486118
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>FWIW<br></div><div>Reviewed-by: Linas Vepstas &lt;<a =
href=3D"mailto:linasvepstas@gmail.com">linasvepstas@gmail.com</a>&gt;</div>=
<div>=C2=A0</div><div>*** Notes: I wrote the original EEH handler, and thre=
e or four ethernet and scsi EEH recovery drivers (including lpfc and qla, i=
f I recall correctly). I&#39;ve been inactive in kernel development for mor=
e than a decade; I did read this patch series (carefully); it seems excelle=
nt, from my rather distant viewpoint. My apologies if this email feels like=
 noise to anyone on the cc list; I feel obliged to respond. -- Linas<br></d=
iv></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Aug 13, 2025 at 12:11=E2=80=AFAM Lukas Wun=
ner &lt;<a href=3D"mailto:lukas@wunner.de">lukas@wunner.de</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">The kernel suppor=
ts three different PCI error recovery mechanisms:<br>
<br>
* AER per PCIe r7.0 sec 6.2 (drivers/pci/pcie/aer.c + err.c)<br>
* EEH on PowerPC (arch/powerpc/kernel/eeh_driver.c)<br>
* zPCI on s390 (arch/s390/pci/pci_event.c)<br>
<br>
In theory, they should all follow Documentation/PCI/pci-error-recovery.rst<=
br>
to afford uniform behavior to drivers across platforms.<br>
<br>
In practice, there are deviations which this series seeks to reduce.<br>
<br>
One particular pain point is AER not allowing drivers to opt in to a<br>
Bus Reset on Non-Fatal Errors (patch [1/5]).=C2=A0 EEH allows this and the<=
br>
&quot;xe&quot; graphics driver would like to take advantage of it on AER-ca=
pable<br>
platforms.=C2=A0 Patches [2/5] to [4/5] address various other deviations,<b=
r>
while patch [5/5] cleans up old gunk in code comments.<br>
<br>
I&#39;ve gone through all drivers implementing pci_error_handlers to ascert=
ain<br>
that no regressions are introduced by these changes.=C2=A0 Nevertheless fur=
ther<br>
reviewing and testing would be appreciated to raise the confidence.<br>
Thanks!<br>
<br>
Lukas Wunner (5):<br>
=C2=A0 PCI/AER: Allow drivers to opt in to Bus Reset on Non-Fatal Errors<br=
>
=C2=A0 PCI/ERR: Fix uevent on failure to recover<br>
=C2=A0 PCI/ERR: Notify drivers on failure to recover<br>
=C2=A0 PCI/ERR: Update device error_state already after reset<br>
=C2=A0 PCI/ERR: Remove remnants of .link_reset() callback<br>
<br>
=C2=A0.../ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c=C2=A0 =C2=A0|=C2=A0 1 -<b=
r>
=C2=A0.../net/ethernet/qlogic/qlcnic/qlcnic_main.c=C2=A0 |=C2=A0 2 -<br>
=C2=A0drivers/net/ethernet/sfc/efx_common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 --<br>
=C2=A0drivers/net/ethernet/sfc/falcon/efx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 --<br>
=C2=A0drivers/net/ethernet/sfc/siena/efx_common.c=C2=A0 =C2=A0|=C2=A0 3 --<=
br>
=C2=A0drivers/pci/pcie/err.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 40 ++++++++++++++-----<br>
=C2=A0drivers/scsi/lpfc/lpfc_init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/scsi/qla2xxx/qla_os.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ---<br>
=C2=A08 files changed, 32 insertions(+), 27 deletions(-)<br>
<br>
-- <br>
2.47.2<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Patrick: Are they laughing at us?</div><div>Sponge Bob:=
 No, Patrick, they are laughing next to us.</div><div>=C2=A0<br></div><br><=
/div></div>

--0000000000002bf012063c486118--


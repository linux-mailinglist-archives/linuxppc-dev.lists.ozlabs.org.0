Return-Path: <linuxppc-dev+bounces-10485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF46B171F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 15:23:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bt8sG12rBz2yLB;
	Thu, 31 Jul 2025 23:22:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.54 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753968178;
	cv=pass; b=DF1DrIWzWeAn7iWy5ysVS0muad6QEl5mO/8Ky7IxgX/a99MlA23Noma/mEJ6gcdH5bCTH2FhVUPo3Hr9cdLuSnKmk1cN3CoWjY7k9iAkR03nLqbGLVd2GayAzM1Nd83uVGsNYpPTBTZHOKgOX7uG02OJOL8v4MLxCZLpaXofCtFC+gvPwQKNfMsbQ98oHGObt9nNSHoKfwj4Je8DAn4OLYgTSdKklnwUspxIe2KyHvGwzCLzi7765dMXQMklIz8L42da9ATT4j8SAAKcJprDNxBRdBr2M4SD3Hr3WhBcfEZnOmQtbC3Ugdp2FaSsQTDYlfyd64b95YNpU21H88+BFw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753968178; c=relaxed/relaxed;
	bh=0NO+LrDFsDJhcsc++NJOtynVSrq89Uxl2AVXv5isfpU=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=ICwthP4r16pYPns1+cO8ZMxxre+mfgCAX5wcgeZbKy7ygj1y6cYefnpMa9QpqokdehwO5hgVAEsw/uHTK6QpbObZ6ZSBJs3RlGnLIIZitl+0yEbTX/stpGPC5vCpg6xfIVR4ejvPKavueT5rkSh9uX6sPu5iMak4bGeak8TMNzzxy6AjcHkVwJ3U+4aJwWuxbrMNhRY+pxOaVSeInemFPOm9lzUGrK26+fcXSd2Pb6R94F6LmZ9SCwwfgbTeQZ2VbZDUficM/g99xrJLLqRk4K6oRZefFgoKQUTyLqEhTkl6crUNIRlYEQERbgb1A6oRp3ARWyuuXCAL0HPR73zqCA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CayLutOK; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=4vvFouYg; dkim-atps=neutral; spf=pass (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CayLutOK;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=4vvFouYg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bt8sB3x4Cz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 23:22:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1753968165; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=TSCh0/PlCeQQE7rGV1cmgS/uLjH4838RR6OCma+Ng/Ac5+74mCvj9qP2Hp9dMKPX6g
    SGVKEdlYjJntP9liLxMTkuHIOeiyDL7riTva1GH3cjJBr02sxJum5uCOZ+f9UxkbCpAV
    +kd7uUXpWkpi+ccwIvsrr1Id8p1rejlw6o51fHw+EjmN5/6Ga+klRD9sBL7FhCiYEMTR
    sdDPf8waIR2ZXnPbEdKdiAxxiGOE5csx8kLmUsDchaShcf0DlphvrSboZvsmlexYwYx8
    QdFn8Ojr0Z+q+ueEGYNOqhU28le1DiDgYv910Sw7WBhj6yr6cqAvXlra6ExEZtYgp1rM
    vsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1753968165;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=0NO+LrDFsDJhcsc++NJOtynVSrq89Uxl2AVXv5isfpU=;
    b=Fx5gSPZcMLBizR1mELqGhKhwRAlc5yL4oWw1vtlkFa5omw9X54dQiuBnuVBqZlYpTK
    PCKD8+48yuY6bBiRz8zN1BbHpiD1Au6SgSeGvnhwibI+TpRmc3G2ANQLyzoTrKqebP2i
    wWt2nLx9zv9Zp/m4AzlfYXcYFH9zHzZKaYDAgtv2GT0k/+tLh4OQF7KH6gUjMsaISdZ4
    8x0+TV22WcTcHGsYAmUppYHFIfgvl+e5V8YmlKg4+SAw0u1vxj16mDAWVpnPfSHkNy66
    iPiBUxS2pe1UVK1Ckfj1DWMAuKB9J/IKcfviA19tghKY8iaLCCB1uA2UDZ+7pqf0gXqO
    exDg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1753968165;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=0NO+LrDFsDJhcsc++NJOtynVSrq89Uxl2AVXv5isfpU=;
    b=CayLutOKDlhqFTXu0bjc9ApaHy/DiBemRhjeQzrne3XfX21/SdeBskqY88R7zbF41V
    L3QadPpPBLHrPuBvZZF8I5dAuERUtYUBeROTHVDjLYLQHr3tTJl+LRU2S/DWiRtpOhPH
    Gg6DHmxFtVnVpkfrb/AwjCwMyJfLcSBbtf09VBdHJ+1nzu6iZ2S73SPXzY61xdQVZC+p
    k11q1wQ6oYMNsgr00/AhEoheM68tZqvRYO0FYQtxl7EIaz/VdMz19fAiRcd4E/KS5Rky
    KOD+I3gz4ge23/Z9sBDeza9YluP0s6oPDsSnwCh9KH3Wed7S2XG4ZonVhPcAD/ZE6gWw
    OciA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1753968165;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=0NO+LrDFsDJhcsc++NJOtynVSrq89Uxl2AVXv5isfpU=;
    b=4vvFouYgox8nzg9gigwKtydcsqMMmf+e+qOJvCzaGvb5JPW5/u0oWmlnewXVo6m4j8
    vog3reRRH/dh2v1t50Dg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mzs3zHCHUPVA3N/gJLdDvXsmHsmXN/cif88k0="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c16VDMig5F
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 31 Jul 2025 15:22:44 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Mime-Version: 1.0 (1.0)
Subject: Switching VT failed after commit tty: vt: use _IO() to define ioctl numbers
Date: Thu, 31 Jul 2025 15:22:33 +0200
Message-Id: <436489B9-E67B-4630-909F-386C30A2AAC9@xenosoft.de>
References: <2ECC65F5-18CF-4330-8E5C-9FD863BDA4CD@xenosoft.de>
Cc: mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 Julian Margetson <runaway@candw.ms>,
 Darren Stevens <darren@stevens-zone.net>
In-Reply-To: <2ECC65F5-18CF-4330-8E5C-9FD863BDA4CD@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, jirislaby@kernel.org,
 nico@fluxnic.net, npitre@baylibre.com, ilpo.jarvinen@linux.intel.com,
 gregkh@linuxfoundation.org
X-Mailer: iPhone Mail (22G86)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi All,

Xorg doesn=E2=80=99t start anymore after the commit tty: vt: use _IO() to de=
fine ioctl numbers.

Error message:

xf86OpenConsole: Switching VT failed.

I tested it with QEMU with virtio-gpu-pci and VGA,vgamem_mb=3D256 with some L=
inux distributions today.

I bisected today.

tty: vt: use _IO() to define ioctl numbers is the first bad commit (f1180ca3=
7abe3d117e4a19be12142fe722612a7c)

I was able to revert the first bad commit.

After a new compiling, Xorg works again.

Please check the first bad commit.

Further information: https://github.com/chzigotzky/kernels/issues/14

Thanks,
Christian=



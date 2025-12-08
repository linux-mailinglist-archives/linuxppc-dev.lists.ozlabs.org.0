Return-Path: <linuxppc-dev+bounces-14679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C966CAC1D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 07:06:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPs1p3BDqz2yG0;
	Mon, 08 Dec 2025 17:06:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.162 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765173998;
	cv=pass; b=RAFOTu8WPLWmFtxmqblcuuBXySdGogLMYew0Oj/CIHufcEukHGXgzsxcEnlLv53ybopHwDTF+DDaWwgqh3olvnCS2QQ1rtfAmQKPyYCW2j/zH0UpFZTqa3ys5VPryR8HDlsoX8S+1tIVsP66UUB5yZ7p5RbEsurvGQVJqXL4zfxTgExWQaef8u0rsjmpcBzlvzrm5ytccArMrFcvcRexnLqd1hOntMfOUrcxMu43OXp9AuHFXtJT69wN/PB2hYBNr/E8WfLlVtpf3aA85L1ZxvSzpGk/fkLStW0CMnUE1ADxLjJUfJDmHifzR0uGOJEiu7/OjRq1acvOKoY6KQoWGg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765173998; c=relaxed/relaxed;
	bh=pCjOUBk4MIqEg5KqMTWyHYz6eERzfV9i4nO30bn9TVQ=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=LKimfk1IeqXpK3CRHpN9c2ujLE5mKrb3rt0319kyBXXvzDR6sE9yM5uT+nH22h2osdBESO8BM5iTfRXOMrVHuJuT5siq11z+r6REmvn2T5xAY0wJSjKyDVJa0VGsG54i/ry7iLU91r03Rp7Iump4vMsa2St3KO9PGIaONQZSXEBNu3mFMAvViJx3Bn00XURvliTSLyj3RStXuUKk23VdS6/ULkFIBWCMv80GxZS7eIJPz08/GTfWr9cY75k1STbxx/UtG+GSguCXOzTjME/80t3x4JnlzgXBIBkrCIbg5l0+r+fVArAmgvKIPD/ccDE0jFf7VeIGv67XQF1gl7QmmA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nA+wom/I; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=R6rBZHF4; dkim-atps=neutral; spf=pass (client-ip=81.169.146.162; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nA+wom/I;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=R6rBZHF4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.162; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPs1k2SSGz2yFj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 17:06:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1765173985; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dQ/gHD4hKL8x8d43L5q3c1HdbpgVK/FHN5UqFnX1yHWuuhkjW32ZC/sBB6eVt7eJMl
    rlqdzEz0qvJ3sApuM992z801bHP5k1tlmsn1DzooaKWMOrc37obGS/60PaIjeP2nPt8z
    qzGiPJAZb0ZtY12LH3lj0jXN2am0+4wrVJsmyTqc0wVY3DEqV8BXZvkmUNWb9s76FcpA
    5w+FjWxSGeIN4/VRuKYf2DXF5TLhMYjJAHjXQhxbd1Ta+0uNoDTPbxgPbsrBEoqD6gdb
    rg28mQ6biaaHUqq4BhIP2M2Nasn1g642Wr+XCZ4OPCSvRuiHUqT0Cdxo8X2Vgdfsx5XL
    fF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1765173985;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=pCjOUBk4MIqEg5KqMTWyHYz6eERzfV9i4nO30bn9TVQ=;
    b=CkfUJkMLRVP8Jgme8ZlUURGa+XvadZ//BXM5L+AOF903uTT8OvSZe2emsUB6fayxtr
    wMdmFMy8FNJoA65PPWVMJHbC6L4iRrWlE5QvFtru+cyZl98JWbDUJKoHFIJPQR1cFA+w
    YNfpsVXJU5nJH47B57JKXuxytOe8Mv8p6I2YH/UmbKcl+H9etM+MJjZZRf98r2bOKckv
    DkxyN3OICLisoVo3yp9o5qjzEhrxRiAuo7zhc0+m0bPPc6Z/C96C8agq/48LhWhy/55u
    CfU/FZgFt/h6OJ03HmKkUGjZzrekyHBUOBaHLBXZZUz4nGZmnHCQG2Rwo2uizSCGo5b7
    lD6g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765173985;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=pCjOUBk4MIqEg5KqMTWyHYz6eERzfV9i4nO30bn9TVQ=;
    b=nA+wom/I35wFvMh+nIKaYCkPDhspAJF5J0/dk1aojhgBo8+Xwm48gp1KoSdyL1yISA
    C8CLiTdD79SvwzFvkhawWNUxyhV5kOzFcYW6WPMma80hRloz/dAlYbjrjg06qPIt3mSF
    cE4AOAYQFXywgdI2i/AIEqdUe/DWz6VUv+h2UPBIJrp1VjbKSOdY9fmQ3mZBkXhmYMLU
    I8La1xh+CBhZV4lVXx7IgO/CXRJz4iS8erYhl44T5yK+rf75lwNopz6XSUp6JIIRisfO
    FTWmEtOJL46hzZSTYzx+MN0gwmnfhOb7AEHGcqbC0+rIh3w2mFTIWHn8ck1tCIxPGkgz
    CqEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765173985;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=pCjOUBk4MIqEg5KqMTWyHYz6eERzfV9i4nO30bn9TVQ=;
    b=R6rBZHF4P3ya89HYvi6Pb5uYy7FOqg8yUpQapysbt1FkePcEv+Sf4K2W5NXAbHdNjb
    wa9jcVZYNwqpBm0pBvCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5q0s37CXH2VaK7wscHzjYZbkQTUvfpfdB3ufXY="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 54.0.0 AUTH)
    with ESMTPSA id ed69d81B866PADJ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 8 Dec 2025 07:06:25 +0100 (CET)
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
Subject: Re: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
Date: Mon, 8 Dec 2025 07:06:14 +0100
Message-Id: <B654DA82-1EEF-4D2C-8003-BAF32C5DE2E2@xenosoft.de>
References: <aTZnZHYdZMXI-FE8@Gautams-MacBook-Pro.local>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <aTZnZHYdZMXI-FE8@Gautams-MacBook-Pro.local>
To: Gautam Menghani <gautam@linux.ibm.com>
X-Mailer: iPhone Mail (23B85)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> On 08 December 2025 at 06:51 am, Gautam Menghani <gautam@linux.ibm.com> wr=
ote:
>=20
> =EF=BB=BFHi Christian,
>=20
> Thanks for the report. Can you also please share the QEMU command line
> you were using? That would be helpful.
>=20
> Thanks,
> Gautam

Hi Gautam,

Here is the command line:

qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -drive format=
=3Draw,file=3Dvoid-live-powerpc-20230317.img,index=3D0,if=3Dvirtio -netdev u=
ser,id=3Dmynet0 -device virtio-net,netdev=3Dmynet0 -append "rw root=3D/dev/v=
da" -device virtio-gpu-pci -device virtio-mouse-pci -device virtio-keyboard-=
pci -device pci-ohci,id=3Dnewusb -audiodev id=3Dsndbe,driver=3Dpa,server=3D/=
run/user/1000/pulse/native -device usb-audio,bus=3Dnewusb.0 -enable-kvm -smp=
 4 -fsdev local,security_model=3Dpassthrough,id=3Dfsdev0,path=3D/home/amigao=
ne/Music -device virtio-9p-pci,id=3Dfs0,fsdev=3Dfsdev0,mount_tag=3Dhostshare=
 -display gtk

Thanks,
Christian=



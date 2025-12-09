Return-Path: <linuxppc-dev+bounces-14697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396DECAF4EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 09 Dec 2025 09:34:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQXG55s0Kz2xs4;
	Tue, 09 Dec 2025 19:34:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.161 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765269277;
	cv=pass; b=D6LcWAfbfu2UOpUYii5xgKA8NYsK95Y6gH/LeoSlAvuaOWnRMqqifvQGEp0F+OVNFDh1smmdRBR02stJhG4pxWrKMjsjGxPpvz6Qo4D6UUrNN0oLnv1spq5w5/656t7lnDQSt6n2+rrj9Vq0eSkoAhQGb5ZUJpHdIOyKCe2m5iVIcpbzPmYXUUF/+RoTnh9X599XTV6vNuKKSBgWQPsI0WQbpWCu/9Wrb6omZOpzUA3RzP/Mv9SPXvHCqWAs7Rdbyn0PjPnR3JrMYFK2OaXqyufAmIvwhGW3jc3B9HSu0yl1Y+mfKAPrpb5QxIoaiPuFDeZbs4lNW9rrWeA7T5Alqw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765269277; c=relaxed/relaxed;
	bh=J+3AuC7/WB6sf4vFMKRGpGpEDN4G1Al9vbrFNXk3SBw=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=E1gOcvU3LYTegCZ2DgH/F1xW1OLW90TIm5lSr/XyVjQmcDY8s7dEm3ljPTJsbF1pYddLsg677S1/HIhcmVz6WEwDO7drreHxI70wvmWiwx4OShZDGEh9A3HSCy49O0t+P1+uLkD2RJvALWX2V8ayQ5OhQDFPy7gDSc27WL/VWYh88Epeu8WDmeaHwEVlqBHGf54Bfl5gBUVXVkPBUPcWbe45EFkpa2vIACqBys4XCLoFJuWL03DYvnlJLyAhasJESzEAB5Xnq0ir3KrXbAS700BrcUrvF+WVesUM0JKEH6EesExmTjEuFeGNO+QM3AzS7mhjB8qgJlSnUsjr5xEngg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WQSyaZGc; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=0M+CxbtY; dkim-atps=neutral; spf=pass (client-ip=81.169.146.161; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WQSyaZGc;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=0M+CxbtY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.161; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQXG13jGVz2xPf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 19:34:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1765269263; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OrwtHAnFzNZl/NqgGXTPgwRA9rDN1CBkueAYJmoXjEuAGLfcJabbW1JZkVqoYwhE59
    O5lXPV5OxgxDhWz5VttbtjwsmWjmO5m98oF6aNrhVM0pg3PKJQ4Szo2XvqzkeIM3tyu6
    W23AscH2sbV/sDj5ewzaHXZGMHoJv0DuQEzNJKMRL5WN2PP2cRkP5fDhLj254kiPq1CU
    a34I3ZSHBwKW4N7jyzwUiVodWw7ZcvFTgA56QPnFThESfXrekGGFX982pG4BKyAqQ/9C
    ptwDtsmSrFS4sXTpEgk4yvapAG6QBfIB/77Ut0Y3LTx9Aa+lA7whK5ON/XygxtxJbDfc
    hT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1765269263;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=J+3AuC7/WB6sf4vFMKRGpGpEDN4G1Al9vbrFNXk3SBw=;
    b=IGKtehqagx3a+y+u7R8r4QPBJRPU3aRRIy2jznl8rBD7kYRdPt05UWqVZO6soWw0ML
    ziFP2Hr3nIVQUfdp9JBsio5LL3IIQhmnW6+jQ/JbHd3BwD0WCtfjfqTDyTQEoyoX/NI4
    2R0lEERRRptyunHH6TAQJEZcz5De/c5keSYP5uRkyCyIBWTKqs6hNGWGHQfGD+WhhEym
    JahvObOL3dr+iLudXYHmMAtUidL12Wr9YUq7laqC/tyjUUxSMyLQXtJAT/Buof1Xip/d
    edQ1h8N5oiH2aes5iDczynUeu6gpxJnPnpbfzVxoBWVsR6/cIZT+akLWJgnQaggQH8Eh
    T0zA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765269263;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=J+3AuC7/WB6sf4vFMKRGpGpEDN4G1Al9vbrFNXk3SBw=;
    b=WQSyaZGcHhq1kAZVAI8TeWCj7lk2HX4G2XPlITIyk7KYaqWPXpdWLI9XTYzcYQkvgR
    6XfWgXrPeJ7SldEyHedpbhjpbuy6eevwcJSLuZ8simHoANI00TO59NBU3UGVmdvmcOtc
    3t1oHn6+hlcGraOWHvIoyb1N2liVFD/fBMB843ZcsOGv0EmaafvUAJwZrbpv0COy2scK
    2DTuc67P1UQ3fdZ7E42z7r5TT+Gh/VPGphSzJXuq2GdPjhDYrdwDznSR3dRunVKR2V7k
    j5/lJGb21S+aWJ+se09qNduDtsIRBMhN0AKWRnvGeWF4R0fRJ2bw3gcGBC3IQHCNpAYe
    yE9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765269263;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=J+3AuC7/WB6sf4vFMKRGpGpEDN4G1Al9vbrFNXk3SBw=;
    b=0M+CxbtYpI6NsOKkHIx3yFHwyYdJD3AI6rhhOTYr29MwPOvT0w/klOd2Hm6IR1VzrY
    Vso7GQh/E9B//dSjdYBw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mxsyjMXnXpuj4qk60BLOD29y2Dgz9yoVH7AMU="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 54.0.0 AUTH)
    with ESMTPSA id ed69d81B98YMFR7
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 9 Dec 2025 09:34:22 +0100 (CET)
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
Date: Tue, 9 Dec 2025 09:34:11 +0100
Message-Id: <E1392190-6049-4128-BC65-42C90DA95047@xenosoft.de>
References: <aTe7I_nVw8xp4az9@Gautams-MacBook-Pro.local>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <aTe7I_nVw8xp4az9@Gautams-MacBook-Pro.local>
To: Gautam Menghani <gautam@linux.ibm.com>
X-Mailer: iPhone Mail (23B85)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MIME_QP_LONG_LINE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 09 December 2025 at 07:01 am, Gautam Menghani <gautam@linux.ibm.com> wr=
ote:
>=20
> =EF=BB=BFOn Mon, Dec 08, 2025 at 07:06:14AM +0100, Christian Zigotzky wrot=
e:
>>=20
>>>> On 08 December 2025 at 06:51 am, Gautam Menghani <gautam@linux.ibm.com>=
 wrote:
>>>=20
>>> =EF=BB=BFHi Christian,
>>>=20
>>> Thanks for the report. Can you also please share the QEMU command line
>>> you were using? That would be helpful.
>>>=20
>>> Thanks,
>>> Gautam
>>=20
>> Hi Gautam,
>>=20
>> Here is the command line:
>>=20
>> qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -drive for=
mat=3Draw,file=3Dvoid-live-powerpc-20230317.img,index=3D0,if=3Dvirtio -netde=
v user,id=3Dmynet0 -device virtio-net,netdev=3Dmynet0 -append "rw root=3D/de=
v/vda" -device virtio-gpu-pci -device virtio-mouse-pci -device virtio-keyboa=
rd-pci -device pci-ohci,id=3Dnewusb -audiodev id=3Dsndbe,driver=3Dpa,server=3D=
/run/user/1000/pulse/native -device usb-audio,bus=3Dnewusb.0 -enable-kvm -sm=
p 4 -fsdev local,security_model=3Dpassthrough,id=3Dfsdev0,path=3D/home/amiga=
one/Music -device virtio-9p-pci,id=3Dfs0,fsdev=3Dfsdev0,mount_tag=3Dhostshar=
e -display gtk
>=20
>=20
> Were you running a KVM guest? Did you see the problem with the latest
> kernel installed in the guest?

Yes, the latest git kernel doesn=E2=80=99t boot.

But the final kernel 6.18.0 boots without any problems.

Thank you for your help.

- Christian=



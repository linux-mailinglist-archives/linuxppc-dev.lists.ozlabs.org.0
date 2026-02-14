Return-Path: <linuxppc-dev+bounces-16865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LnfNzeBkGncaQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Feb 2026 15:05:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC87B13C2B1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Feb 2026 15:05:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fCrR568xvz2yFk;
	Sun, 15 Feb 2026 01:05:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.163 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771077937;
	cv=pass; b=bv+45VemQvqwG75y7kNdXzsYEd2DxiLs4SNoeIloAdgXdJp/aef4sNENjizJx4u0IHAVvGUxRsbt7AHFvB5C+baikskEhp6Ew51RAT1D+CbgEbb+IWbsNSZX4WqhQ2ET/mgxriluE7UlUE6RWl1mvHBW2GohQAl904I1+zAYkTJ/n6rgDOts4NhHbo1hLYxK2rOJJg1FfL30gtPb4jpxyZnUhu39pJ44VatCivnk6rEmGcd+JadKP0MFtBzJxeGi1ZVptc+zGHPuJJfQRRpO72nKOA+Cjh/Z3bod6hDw9+OAyMPB+Bthxw2AwU71hQavx9PWM1R1nNlh9TU50kaBDg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771077937; c=relaxed/relaxed;
	bh=pyVNx/QiO7Slo7z0VquiA9s7yUlC0HUTp1usBsfViv8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=I1vvCa9D7QU1CRoDkZvhetf8I4pIkTXs9Wo61mkHELDaA9zmVyAUXJnQp3OMSulSj9N7bkpZvWocH74aR9XGdpjLDuo1qow2TCPlMbn12uGp0bbENwUeiqf9VBh8GDtxJNcjI+3Q6rUEH0Ak24fd3z9pVSWJl3Eu5/sP2lFk8cYL/TvjaaKZs8oPfKG+ZXYYp96c2xgabigSh78DqSPtsveAMmBg0s1B8lzibXk+GrhgCN9VGaYfeiBYJ3dPDQRO3ArW9IP46IY/F4MAd6vn7y/NDo1gGuC+YWIdWCNOkv0L+FO8oGlmfkP8UTeDC3dBrEhzd0Lpz/zKD+CGt+nsQw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Nw0ps78u; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=7DsT63Md; dkim-atps=neutral; spf=pass (client-ip=81.169.146.163; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Nw0ps78u;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=7DsT63Md;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.163; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 164 seconds by postgrey-1.37 at boromir; Sun, 15 Feb 2026 01:05:33 AEDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fCrR16yLBz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Feb 2026 01:05:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1771077742; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=CQjWSJwf+IpJt4a5uaWmb+eDukU0TMQDQ72JWY4WMBgMkUUAVi9h9AXBHw9yKqvqka
    U/hOw6lMXJJ1vPxMuKac0Jx/34xma8ACPXpo6UlXuojsjjv7se/g4GxJf8Zq+slWkgr7
    0tYv00TlTqNT5fU1N0M55gvkAFtXHJVfQ3QXVKuEAoPfSTCds9qQSOKjM2lYz/VbVwKc
    jqU3SBAsdl+L5zMRVBwDWKwqErWA6LpUqBW9l8jiMxH8Oj23rG0755XYv3cY2vQq554e
    qhE3A7p1gCMiL/j2d7zqkeLHZixz4ZPqwAWEuwFvL9Uts0jO40/YaVV6PJN8n7frOivy
    ZoTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771077742;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:From:Cc:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=pyVNx/QiO7Slo7z0VquiA9s7yUlC0HUTp1usBsfViv8=;
    b=VofA5JEzihcmtQYfYlTrLq9VmUnXLaedvH1R2sf6d2kC2J/ez4RFT1VBaaaoOgK/7L
    sSy+AjdT1Nvf8tLA6IMt/iSpz6h5wUtfp5ye61M03/AMROtcDaQyoK2/RaBeQknC5lmo
    ZgZDtFHA1QxkdKJgulIoLiI7LGmrnyNcEzEwrhk0D0UwuI4RpfmJ8/xE6Zr8p6UwUnEo
    81nyq3djbpe2pldQTluHaqPj+TaRL1nb6tud4M6wI1Yz0XFtrjODaebPQUxP3sCQPfOK
    +YfTzN2cdyGvodPQ2mPEIQOr/5xf5Z8m65D4Jk2BybLLHi3yDtEGaKmsbJ5r3gFCxAN+
    mm3Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771077742;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Subject:From:Cc:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=pyVNx/QiO7Slo7z0VquiA9s7yUlC0HUTp1usBsfViv8=;
    b=Nw0ps78uvqED6YTdZNwE5NamIc0VVB0X4JWFSKZwx6ogte9Yp4Pzh6XBFth7pPCUDy
    JLLFRIaIxSiH/b4NblT00km5wlYfWlwZZ1gRScmABnxVBFmZBFBBYKaFtSKsSYPYgRV7
    T2odWa3HBcjwahmsVIMlE2u55NCqQaAd1gfTgu3NcmlXA1nSeEwPVYxUn70M4ecSRuDv
    iTQ3Jw/H5BCb18Fp5JPjlavBUNTTlH8+iCKOhpId5ygsvIkYbTrDzeJc/WcITlSzHnrZ
    HqKbiyKcLw2cLlWF6WpmlQcxH6edTnH4PQnfWjEs55VYbNq0WLtYEXnfrXVZR9c7gDmZ
    uyzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771077742;
    s=strato-dkim-0003; d=xenosoft.de;
    h=Subject:From:Cc:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=pyVNx/QiO7Slo7z0VquiA9s7yUlC0HUTp1usBsfViv8=;
    b=7DsT63Mdw1V1XZsBfm+fhrRDlwGj4q/VW90GJjmUllxgEjQiYT9ohmulZdDJeqrk/N
    2cuy2e5/8JfIZa6BVeAw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIy+l7xzg"
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id e9337f21EE2MruD
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 14 Feb 2026 15:02:22 +0100 (CET)
Message-ID: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
Date: Sat, 14 Feb 2026 15:02:21 +0100
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
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [Linux PPC] KVM PR and KVM HV do not work if the kernel was compiled
 with PREEMPT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[xenosoft.de,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[xenosoft.de:s=strato-dkim-0002,xenosoft.de:s=strato-dkim-0003];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16865-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[xenosoft.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenosoft.de:mid,xenosoft.de:dkim,raw.githubusercontent.com:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: CC87B13C2B1
X-Rspamd-Action: no action

Hello,

KVM PR and KVM HV do not work if the kernel was compiled with PREEMPT.

The entire FSL Cyrus+ board freezes when using KVM HV with PREEMPT.

The guest kernel doesn't boot if we use KVM PR with a PREEMPT kernel on 
the PA Semi Nemo board.

We were previously able to disable PREEMPT in the kernel configuration, 
but the latest git kernels now enable it by default and it is no longer 
possible to disable it.

I created a patch for disabling PREEMPT today. [1]

Is it possible to let us decide whether to activate PREEMPT or not?

Thanks in advance,

Christian

[1] 
https://raw.githubusercontent.com/chzigotzky/kernels/a74fa6179eaeafcea7ad89f0e61c30ace038daf2/patches/X1000/Kconfig.preempt.patch
[2] Bug report: https://github.com/chzigotzky/kernels/issues/19


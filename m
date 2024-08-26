Return-Path: <linuxppc-dev+bounces-490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B59C095E7F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 07:39:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsfcY2Mnzz2y33;
	Mon, 26 Aug 2024 15:39:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724650749;
	cv=none; b=hRBpQHKFPHvg7Q6xED8q8bicn8GBBLqTrFQ3LpxSC2z02n9BzcB1n6RZJbqMSGA6BPlHM0MBPBtsOkuygvXVQX91hxUXsZEzuG1kkqGmDurx7VMEJmOd0b7AQQ72ygPKTWh1wVsRI/HsBn5vwbiQEUjDPqyIJIVi7A7zgR4q80/ggLxxhlCh1woxAwYoJ8JkZnEOMfD5MrSeteHctLyPFs19mkz+0pBoxySundHsGuG+fQqcLQfvR55Hwo+MEMbJTgMAf41rOCaO0uRvWO7P5ZN3yAnpKVVS+3WK5iAdFkqSkTcTxKbShcwUthhwBtkuYKt8bRldzGWedkxLVlCiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724650749; c=relaxed/relaxed;
	bh=LfT86w0DD1Bxg2yTlCdTPH77SKbVGJZWodC7UbCGiEE=;
	h=DKIM-Signature:Received:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Original-Sender:X-Originating-IP:
	 X-ZEDAT-Hint; b=gkliDXEZ86JPckQTLaQcFffM4L6lqYGUxXPR2ADXHVFgX9iFwK0CDFlck2C/cbRzuVSJrObwC71gBrxr8mrdslHoBZqeeI22U3ws79+2w1yZbTX/h8zsKBA7SjIGZsNqFVKr/J67XKcehn7brJdPDdrIcNbyOfVsxGzNGmsdvO5k3TVjFQM/HWDRx5zqAP2I0M+bPR5y3m7Mv6ZAW/dnYS6upwBwdXUi3IlDxcBEyJfCWc0RwyMgRuhfY9NHoXi0PoSrZb8dtJ7+9jnnQXTBhgiJ831BWGmdYq19xOcJGpR41hdsG/GixapubogXs+PeOcoTmnJzLPG3jaWrwm284Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=evkiIvcn; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=evkiIvcn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsfcV33g6z2xy8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 15:39:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LfT86w0DD1Bxg2yTlCdTPH77SKbVGJZWodC7UbCGiEE=; t=1724650746; x=1725255546; 
	b=evkiIvcngY+Xd8Sw/8xB8rhEgVoBvr7nWftF5oUMWMwuBWPXmypFkMzstQeh0l2uLX2wgNYUo0M
	bextPGTefds5ctonew2nD5Wn4eKXVVid8CbGpdpr8t2BWtyEPl7gUkFaEj+bnOKEO9aodCq5ztqkd
	X3QIJjDXkVMPMgjTOyCUyS35S7jKIR2wQ9wxdGa2vzDCROlqDeZ880BO94nnYw8etBADgpQP0q7Cl
	7cifaBi5rAGqIDOYT0im0qC1c2SQ81tqwqU6sNH6c91e362q2+3DMeW1XVDArNEhLPEvFytp+VcwL
	nMYzEjofO7w9mCZHxwxBhhmO8KDgFKLltl9A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1siSRK-00000003X59-0z93; Mon, 26 Aug 2024 07:38:54 +0200
Received: from p5b13a2bf.dip0.t-ipconnect.de ([91.19.162.191] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1siSRJ-00000002r7f-46hv; Mon, 26 Aug 2024 07:38:54 +0200
Message-ID: <c1fd73a3941c54e58420d7555524cd6baeebfb96.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Ellerman <mpe@ellerman.id.au>, Geert Uytterhoeven
	 <geert@linux-m68k.org>, Dave Vasilevsky <dave@vasilevsky.ca>
Cc: bhe@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
  kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Reimar
 =?ISO-8859-1?Q?D=F6ffinger?= <Reimar.Doeffinger@gmx.de>
Date: Mon, 26 Aug 2024 07:38:53 +0200
In-Reply-To: <87frqsghws.fsf@mail.lhotse>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
	 <CAMuHMdVYNhFJ+qBDP3_fi9oeHsgOL0vqPe1YqE18+M8n1onssw@mail.gmail.com>
	 <87frqsghws.fsf@mail.lhotse>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.162.191
X-ZEDAT-Hint: PO

Hi Michael,

On Mon, 2024-08-26 at 12:02 +1000, Michael Ellerman wrote:
> > What is so special about CRASH_DUMP, that it should be enabled by
> > default?
> =20
> The reality is that essentially all distros enable it. Because they
> don't want to manage separate kernel / crash-kernel packages.
>=20
> So IMHO having it enabled by default in upstream does make sense,
> because it more closely matches what distros/users actually run.

Well, at least Debian did not enable it by default as otherwise we wouldn't
have noticed this change downstream.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAFF7194A1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 09:46:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWyrM4ZtFz3dyQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 17:46:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=<UNKNOWN>)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWyqv44nyz3bbZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 17:46:19 +1000 (AEST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1q4d0a-001zrK-5A; Thu, 01 Jun 2023 09:46:08 +0200
Received: from p57bd9d78.dip0.t-ipconnect.de ([87.189.157.120] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1q4d0Z-002wPt-St; Thu, 01 Jun 2023 09:46:08 +0200
Message-ID: <d0ab5473947004ab9f26a07784a2f122574b7a60.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 01 Jun 2023 09:46:06 +0200
In-Reply-To: <CAMuHMdVx_0Dhz1fOsCr3aYAVpk1HypoPJwbdNDj3h08x4esu0g@mail.gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
	 <20230531213032.25338-31-vishal.moola@gmail.com>
	 <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
	 <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
	 <CAMuHMdVx_0Dhz1fOsCr3aYAVpk1HypoPJwbdNDj3h08x4esu0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.157.120
X-ZEDAT-Hint: PO
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-06-01 at 09:42 +0200, Geert Uytterhoeven wrote:
> Hi Adrian,
>=20
> On Thu, Jun 1, 2023 at 9:28=E2=80=AFAM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > On Thu, 2023-06-01 at 09:20 +0200, Geert Uytterhoeven wrote:
> > > On Wed, May 31, 2023 at 11:33=E2=80=AFPM Vishal Moola (Oracle)
> > > <vishal.moola@gmail.com> wrote:
> > > > Part of the conversions to replace pgtable constructor/destructors =
with
> > > > ptdesc equivalents. Also cleans up some spacing issues.
> > > >=20
> > > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > >=20
> > > LGTM, so
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >=20
> > I assume this series is supposed to go through some mm tree?
>=20
> I think so, so your Acked-by would be appreciated...

OK, I will have a look. Btw, can you have a look at the second series by
Artur ("SuperH DMAC fixes")? I haven't had the time for these yet, but
I will have time in the weekend.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

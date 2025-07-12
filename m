Return-Path: <linuxppc-dev+bounces-10201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A375B02D7E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 00:54:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfkR56Hlsz2xQ6;
	Sun, 13 Jul 2025 08:54:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752360849;
	cv=none; b=i2TkL1OH4iGZWjk9ZOq7d8oKoIoXwh8J2UrIdu6IxIr3rsOVahWc1RN85zJTnU0RZaAPsevKAPelETqFSUSVduZ1NU2FUqe57kRyQ46eedm+QphcU32VD+ip74tYRH1g3BwaBUg17QkUDXE0fVo4yEP+hmp0XWvulk4gilOLZwdggAmSJ2Hvuf3xRSkqZKSlMU7aqlofRb87HuO5Vwv9hhlQ5PBEazjmtf/nDDKzAgVWwHsGWtk3Ugmdxvn6+TOSR/qr+WMBq8j/fDLQjWh3kQChaQq5kh97ZrCXvo39ESp+WNyvrKdDyR+3q2wSmr1ki9st9PE8blMoNZPZP0CrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752360849; c=relaxed/relaxed;
	bh=29kC8ZoHaK7TjnMGZN7SRbZxG/qgBX7Ra7q0YGqMOSE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=f+YLALnqPLTZOxl5HySkS0fvqL8w1WQADXSuIqo7LQ96NgiA3YNi8cKpkcORJo+t2gmL4BirA0sKybsIet+k36aP4iRnp9N4Ev5CFIIv76dAsmecVJaaRYtHSFD9OnE57BCbh7CC37wgeAJqVPHan8f17lXLR2Jy4YY+5+KYpqn1VjETdrX269KA6S6MMihGI1x0ZCeDk5Swwrzoswdl/Re1pSMl0HEUESLMLrFCBnpI0VjsGQLMYiwYtmvquNb3EuiCEqFtJ/sPKZfsCt+22py6XG/3lgs2VdaODI3qc6lkSK76QTc42yoGb+XKHrvGQzi4lQa9qGJa2V5jWxGBEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org) smtp.mailfrom=orcam.me.uk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 344 seconds by postgrey-1.37 at boromir; Sun, 13 Jul 2025 08:54:08 AEST
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfkR43hcpz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 08:54:08 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 4FCC992009C; Sun, 13 Jul 2025 00:48:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 4196692009B;
	Sat, 12 Jul 2025 23:48:16 +0100 (BST)
Date: Sat, 12 Jul 2025 23:48:16 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Richard Fontana <rfontana@redhat.com>
cc: Segher Boessenkool <segher@kernel.crashing.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Christoph Hellwig <hch@infradead.org>, Thomas Huth <thuth@redhat.com>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, 
    Thomas Gleixner <tglx@linutronix.de>, Nicholas Piggin <npiggin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
    kvm@vger.kernel.org, linux-spdx@vger.kernel.org, 
    J Lovejoy <opensource@jilayne.com>
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
In-Reply-To: <CAC1cPGzLK8w2e=vz3rgPwWBkqs_2estcbPJgXD-RRx4GjdcB+A@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2507122332310.45111@angie.orcam.me.uk>
References: <20250711053509.194751-1-thuth@redhat.com> <2025071125-talon-clammy-4971@gregkh> <9f7242e8-1082-4a5d-bb6e-a80106d1b1f9@redhat.com> <2025071152-name-spoon-88e8@gregkh> <aHC-Ke2oLri_m7p6@infradead.org> <2025071119-important-convene-ab85@gregkh>
 <CAC1cPGx0Chmz3s+rd5AJAPNCuoyZX-AGC=hfp9JPAG_-H_J6vw@mail.gmail.com> <aHGafTZTcdlpw1gN@gate> <CAC1cPGzLK8w2e=vz3rgPwWBkqs_2estcbPJgXD-RRx4GjdcB+A@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
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
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 11 Jul 2025, Richard Fontana wrote:

> > > while this one:
> > >
> > >  *    As a special exception, if you link this library with files
> > >  *    compiled with GCC to produce an executable, this does not cause
> > >  *    the resulting executable to be covered by the GNU General Public License.
> > >  *    This exception does not however invalidate any other reasons why
> > >  *    the executable file might be covered by the GNU General Public License.
> > >
> > > does not seem to be in the SPDX exception list. It is very similar to
> > > `GNU-compiler-exception` except it specifically mentions GCC instead
> > > of saying "a GNU compiler".
> >
> > https://spdx.org/licenses/GNU-compiler-exception.html
> >
> > is exactly this.
> 
> No, because `GNU-compiler-exception` as defined here
> https://github.com/spdx/license-list-XML/blob/main/src/exceptions/GNU-compiler-exception.xml
> assumes use of the term "GCC" rather than "a GNU compiler".

 I don't know what the legal status of the statement referred is, however 
the original exception as published[1] by FSF says:

'"GCC" means a version of the GNU Compiler Collection, with or without 
modifications, governed by version 3 (or a specified later version) of the 
GNU General Public License (GPL) with the option of using any subsequent 
versions published by the FSF.'

which I think makes it clear that "GCC" is a collection of "GNU compilers" 
and therefore the two terms are synonymous to each other for the purpose 
of said exception (in the old days "GCC" stood for "GNU C Compiler", but 
the old meaning makes no sense anymore now that we have compilers for Ada, 
Fortran and many other languages included in GCC).

 NB up to date versions of CRT code refer to the exception as published 
rather than pasting an old version of its text:

'Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.'

References:

[1] "GCC Runtime Library Exception", version 3.1, 
    <https://www.gnu.org/licenses/gcc-exception-3.1.html>

 FWIW,

  Maciej


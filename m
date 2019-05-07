Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A7416320
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 13:55:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yyj71QW0zDqLr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 21:55:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yygr3HZPzDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 21:54:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44yygr2jQrz8tPT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 21:54:16 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44yygr2MdYz9sBV; Tue,  7 May 2019 21:54:16 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=198.54.122.46; helo=new-02-2.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from NEW-02-2.privateemail.com (new-02-2.privateemail.com
 [198.54.122.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44yygq3hcyz9sB8
 for <linuxppc-dev@ozlabs.org>; Tue,  7 May 2019 21:54:14 +1000 (AEST)
Received: from MTA-10.privateemail.com (unknown [10.20.147.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-02.privateemail.com (Postfix) with ESMTPS id 433BD6072C;
 Tue,  7 May 2019 11:54:11 +0000 (UTC)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id 2803460047;
 Tue,  7 May 2019 07:54:11 -0400 (EDT)
Received: from APP-08 (unknown [10.20.147.158])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id 05F4B60045;
 Tue,  7 May 2019 11:54:11 +0000 (UTC)
Date: Tue, 7 May 2019 07:54:10 -0400 (EDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Message-ID: <1137223454.4633.1557230050993@privateemail.com>
In-Reply-To: <87mujywpw0.fsf@concordia.ellerman.id.au>
References: <20190507024321.22281-1-cmr@informatik.wtf>
 <87mujywpw0.fsf@concordia.ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/64s: support nospectre_v2 cmdline option
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev56
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On May 7, 2019 at 5:54 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> 
> 
> "Christopher M. Riedl" <cmr@informatik.wtf> writes:
> > diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
> > index b33bafb8fcea..d775da9b9227 100644
> > --- a/arch/powerpc/kernel/security.c
> > +++ b/arch/powerpc/kernel/security.c
> > @@ -391,6 +394,15 @@ static void toggle_count_cache_flush(bool enable)
> >  
> >  void setup_count_cache_flush(void)
> >  {
> > +	if (no_spectrev2) {
> > +		if (security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED)
> > +		    || security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED))
> > +			pr_warn("Spectre v2 mitigations not under software control, can't disable\n");
> > +
> > +		toggle_count_cache_flush(false);
> > +		return;
> > +	}
> > +
> >  	toggle_count_cache_flush(true);
> >  }
> 
> I'm nit-picking, but would it be better as:
>
Agreed, v3 is on the way :)
> 
> void setup_count_cache_flush(void)
> {
> 	bool enable = true;
> 
> 	if (no_spectrev2) {
> 		if (security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED)
> 		    || security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED))
> 			pr_warn("Spectre v2 mitigations not under software control, can't disable\n");
> 
> 		enable = false;
> 	}
> 
> 	toggle_count_cache_flush(enable);
> }
> 
> ???
> 
> cheers

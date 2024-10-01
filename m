Return-Path: <linuxppc-dev+bounces-1713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1840A98BCF4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 14:59:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHyhH6Dnlz2yJ9;
	Tue,  1 Oct 2024 22:59:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727787583;
	cv=none; b=IYL45XBx4OQu9I4Bk2YjweBY+C4JZE4FJLowctiHfEzTIrxex/OuwKhjgtLJKFkoPHmqRRhcTMDWPRWWvtx8lWPgmt5o4FuRYALo/N473mqAaOqFPlccxCf4065tm7pp7aeJAHe70pfFGF22C7fzNlgccUXbtTvOaFYYXijPNsv4adm0Jhz2uLLiZbCRqmwkdvnih5H7FJ0BR9mj6YJHeikr8Kxsx1zrIA6PmzAteKmn4LTLBo1OxRgANSFQIwQYexZQkbU0aRch2xN68MQUG2/K71Wk8H42BAPFGMvShADVjB4nAyr8YcqJV/nIWhxrsqT+NB4BAAjcAjpPXRyprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727787583; c=relaxed/relaxed;
	bh=sGTUDG4axiShkcwI3wZMimVAzEVDdTcIdqsEhf/QAj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gREyKlIJUxv0YDjerpaV7OzhehusQw5emenJuexZ4JCIqSFps6TCTEOD9ORz3hZM+4mteEECRHfPOPI/cv45Z/js8MLhlguqwyzUD6FimUjnep7wS3vMQqPnlWnZ1/DoNQwysI++nkLQmM88xAlQae2JYq/uptSOcg7GTMpS3lC++UuKAODbR8kgAYipTP3X4nh5tX7s35i3vIOiFcMOTTBl5xwWTmhIbgWuxB1P/HVJp0+d4yGyX7aTtpcvOoDe6kRnbgdirXRLAJIblF2puqEPCXiHDJwPCPqAwwiI1XHR7HhYXAfFXxaPHkkiXBzufPpR9Ao3GGnWQQAfw+QFZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=boyZI+KI; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=byYIEL80; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=boyZI+KI; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=byYIEL80; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=boyZI+KI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=byYIEL80;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=boyZI+KI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=byYIEL80;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHyhG28yvz2xmh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 22:59:41 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 637C31F813;
	Tue,  1 Oct 2024 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727787578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGTUDG4axiShkcwI3wZMimVAzEVDdTcIdqsEhf/QAj8=;
	b=boyZI+KIR6ZecL5qzIHb4AUOSgjpFtX4Y4/2JJ25AcBvLgIPDIyBvQX9UOjasUCMWsY4r+
	YAadDRz1TPpbsi/Upe5P4tyWAc0MasPTLHE1+tWjbTgOs963LbDUVhHM9ZvGX8D2lNvSNX
	3NlqdpWbV0jvTQNrpwVHadQGJ7HSwMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727787578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGTUDG4axiShkcwI3wZMimVAzEVDdTcIdqsEhf/QAj8=;
	b=byYIEL80dQ/Mlau3nuPBqf+opzYwPr+MbtoZgs5MI5pJ6AHhR89MsncXQDfiviobMtwLez
	YbCBuP4lLHcuDxCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727787578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGTUDG4axiShkcwI3wZMimVAzEVDdTcIdqsEhf/QAj8=;
	b=boyZI+KIR6ZecL5qzIHb4AUOSgjpFtX4Y4/2JJ25AcBvLgIPDIyBvQX9UOjasUCMWsY4r+
	YAadDRz1TPpbsi/Upe5P4tyWAc0MasPTLHE1+tWjbTgOs963LbDUVhHM9ZvGX8D2lNvSNX
	3NlqdpWbV0jvTQNrpwVHadQGJ7HSwMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727787578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGTUDG4axiShkcwI3wZMimVAzEVDdTcIdqsEhf/QAj8=;
	b=byYIEL80dQ/Mlau3nuPBqf+opzYwPr+MbtoZgs5MI5pJ6AHhR89MsncXQDfiviobMtwLez
	YbCBuP4lLHcuDxCQ==
Date: Tue, 1 Oct 2024 14:59:37 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Mackerras <paulus@ozlabs.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc/sstep: Unexport analyze_instr,
 emulate_vsx_load, emulate_vsx_store
Message-ID: <ZvvyOeT019FoMPPg@kitsune.suse.cz>
References: <8ecdbd907a8a92cbf9c7308df13f9d19f5ba5621.1727777273.git.msuchanek@suse.de>
 <8e6c75db-5c98-4f82-8151-5f86c53f4cf2@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e6c75db-5c98-4f82-8151-5f86c53f4cf2@csgroup.eu>
X-Spam-Score: -8.25
X-Spamd-Result: default: False [-8.25 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.15)[-0.737];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,ellerman.id.au,gmail.com,kernel.org,linux.ibm.com,ozlabs.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 01, 2024 at 02:08:18PM +0200, Christophe Leroy wrote:
> 
> 
> Le 01/10/2024 à 12:08, Michal Suchanek a écrit :
> > There is no modular user of analyze_instr, and the latter two are only
> > used by sstep itself.
> 
> analyze_instr() is used in arch/powerpc/kvm/emulate_loadstore.c which can be
> a module as far as I can see in Makefile:
> 
> common-objs-y += powerpc.o emulate_loadstore.o
> 
> kvm-book3s_64-module-objs := \
> 	$(common-objs-y) \
> 	book3s.o \
> 	book3s_rtas.o \
> 	$(kvm-book3s_64-objs-y)
> 
> kvm-objs-$(CONFIG_KVM_BOOK3S_64) := $(kvm-book3s_64-module-objs)
> 
> config KVM_BOOK3S_64
> 	tristate "KVM support for PowerPC book3s_64 processors"

Indeed, missed that it can be modular thruogh this indirection.

Thanks

Michal

> 
> 
> > 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> >   arch/powerpc/lib/sstep.c | 3 ---
> >   1 file changed, 3 deletions(-)
> > 
> > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > index e65f3fb68d06..a0557b0d9a24 100644
> > --- a/arch/powerpc/lib/sstep.c
> > +++ b/arch/powerpc/lib/sstep.c
> > @@ -863,7 +863,6 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
> >   		break;
> >   	}
> >   }
> > -EXPORT_SYMBOL_GPL(emulate_vsx_load);
> >   NOKPROBE_SYMBOL(emulate_vsx_load);
> >   void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
> > @@ -955,7 +954,6 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
> >   		break;
> >   	}
> >   }
> > -EXPORT_SYMBOL_GPL(emulate_vsx_store);
> >   NOKPROBE_SYMBOL(emulate_vsx_store);
> >   static nokprobe_inline int do_vsx_load(struct instruction_op *op,
> > @@ -3172,7 +3170,6 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
> >   	op->val = SRR1_PROGTRAP;
> >   	return 0;
> >   }
> > -EXPORT_SYMBOL_GPL(analyse_instr);
> >   NOKPROBE_SYMBOL(analyse_instr);
> >   /*


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461A282809
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Oct 2020 04:13:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C3nM419SGzDqRZ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Oct 2020 13:13:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.78; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0078.hostedemail.com
 [216.40.44.78])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C3nKS5Q82zDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Oct 2020 13:11:38 +1100 (AEDT)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 0132A100E7B43;
 Sun,  4 Oct 2020 02:11:35 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:967:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3872:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6119:7903:9025:10004:10400:10848:11026:11232:11473:11658:11914:12043:12296:12297:12438:12555:12663:12679:12740:12760:12895:12986:13161:13229:13439:13618:14181:14659:14721:21080:21324:21433:21451:21611:21627:21811:21990:30025:30029:30054:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: soap16_3903463271b1
X-Filterd-Recvd-Size: 3708
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Sun,  4 Oct 2020 02:11:33 +0000 (UTC)
Message-ID: <9541b95e9b36e606d62174aa46ec8265f36652d6.camel@perches.com>
Subject: Re: Where is the declaration of buffer used in kernel_param_ops
 .get functions?
From: Joe Perches <joe@perches.com>
To: Matthew Wilcox <willy@infradead.org>
Date: Sat, 03 Oct 2020 19:11:30 -0700
In-Reply-To: <20201004013626.GE20115@casper.infradead.org>
References: <cover.1601770305.git.joe@perches.com>
 <250919192de237dadf36218ee6b4dabf1bd4cbde.camel@perches.com>
 <20201004013626.GE20115@casper.infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, rcu@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2020-10-04 at 02:36 +0100, Matthew Wilcox wrote:
> On Sat, Oct 03, 2020 at 06:19:18PM -0700, Joe Perches wrote:
> > These patches came up because I was looking for
> > the location of the declaration of the buffer used
> > in kernel/params.c struct kernel_param_ops .get
> > functions.
> > 
> > I didn't find it.
> > 
> > I want to see if it's appropriate to convert the
> > sprintf family of functions used in these .get
> > functions to sysfs_emit.
> > 
> > Patches submitted here:
> > https://lore.kernel.org/lkml/5d606519698ce4c8f1203a2b35797d8254c6050a.1600285923.git.joe@perches.com/T/
> > 
> > Anyone know if it's appropriate to change the
> > sprintf-like uses in these functions to sysfs_emit
> > and/or sysfs_emit_at?
> 
> There's a lot of preprocessor magic to wade through.
> 
> I'm pretty sure this comes through include/linux/moduleparam.h
> and kernel/module.c.

Dunno, looked there, still can't find it.

btw:

The __module_param_call macro looks very dodgy
as it uses both __used and __attribute__((unused))
and likely one of them should be removed (unused?)

It looks like the comes from varying definitions of
__attribute_used__ eventually converted to __used 
for old gcc versions 2, 3, and 4.

1da177e4c3f4:include/linux/compiler-gcc2.h:#define __attribute_used__   __attribute__((__unused__))
1da177e4c3f4:include/linux/compiler-gcc3.h:# define __attribute_used__  __attribute__((__used__))
1da177e4c3f4:include/linux/compiler-gcc3.h:# define __attribute_used__  __attribute__((__unused__))
1da177e4c3f4:include/linux/compiler-gcc4.h:#define __attribute_used__   __attribute__((__used__))

Maybe:

---
 include/linux/moduleparam.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 47879fc7f75e..fc820b27fb00 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -288,10 +288,10 @@ struct kparam_array
 	/* Default value instead of permissions? */			\
 	static const char __param_str_##name[] = prefix #name;		\
 	static struct kernel_param __moduleparam_const __param_##name	\
-	__used								\
-    __attribute__ ((unused,__section__ ("__param"),aligned(sizeof(void *)))) \
-	= { __param_str_##name, THIS_MODULE, ops,			\
-	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
+	__used __section("__param") __aligned(sizeof(void *)) = {	\
+		__param_str_##name, THIS_MODULE, ops,			\
+		VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg }	\
+	}
 
 /* Obsolete - use module_param_cb() */
 #define module_param_call(name, _set, _get, arg, perm)			\



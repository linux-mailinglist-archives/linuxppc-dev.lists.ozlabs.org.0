Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1596B6B9874
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 16:00:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbcCj6tfZz3chb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 02:00:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=jyBSUPRn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=andrea.righi@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=jyBSUPRn;
	dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbcBl1GD0z306l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 01:59:57 +1100 (AEDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7EB0D3F1C3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678805994;
	bh=nF+ggmBWwds1ZYP2z1dvsdxQUR9vO8d2eE2ZJ19uHDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=jyBSUPRnxUehbuye4sJyULguBzk6IaxRoADNLMVEIYsV6Fnj/JFWjHiQ8Es2WgOrD
	 zJTCC9bHh+Gl03XytLflY+I4prNnaVP1XqicfmqAq8VE5pVv1M8MgsX0s8kXvJ1nvX
	 R+cArrQTv8PVlD7xVC71GcVSheOkjug0YTp0Z0e3l/njLOjCY9wa9sPebjViULCBEv
	 0MrPl5BobEcyNBwal345UFTwVC9NHKHk0DXeW/AP0Avb+PqDiBZov7oJlOYB6z5WIe
	 FIPMOoH1eMarYJ9PiXqG+JqXFiC8U2ms8stdESCiW4oOxgCW9kDhzBhTmB2sQ5oHAr
	 0fQTawQWBMrqQ==
Received: by mail-lj1-f199.google.com with SMTP id v10-20020a2e87ca000000b00290658792ceso4687055ljj.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 07:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678805994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nF+ggmBWwds1ZYP2z1dvsdxQUR9vO8d2eE2ZJ19uHDk=;
        b=2ZGVwQXNNrNACypooVZxUmI6umFgawb3X4M5zxJCnKzz92OJiagcScxEG+ymW6R9JO
         2qcw2Pn7ZQKWbCHSyfAXOu3KSQFbYcKj1KgXII8+vAE0Btf1AaYTcBBmGCh90J1dkU8R
         QJp1VgPyY8xXywMRZQ5i8OMhy+KC7PXKZQEYs39OOM522U7GF50zgVEO7sxt6UK9Jzdc
         pljoCXYsmJRuUiPHbPFmpB/hJAC83VK8haQjAr9EcgvnfPnBawwKkPW18ecaGEvDTbQc
         RUJoKZT0hbnxA2kbjtpfl24zoaxeZKDe3pJRPkXOvMl6xFoRBEadYph17WzO5QXMvWNo
         Owng==
X-Gm-Message-State: AO0yUKVryfwxI6d7Q143+KpfdY+xTxKA7i5AlIu2+PLMpRelQjn+UTXD
	MhX8QQ1QnHp61lqcOpEnvzWS9I5GLV1R/+715WXPivj6kAHbznRxE00Akemw1eyjk7d/VLnLHiX
	AOEqp5d3oW/4owRS9tO9u/EtyVmzYsu/6Z4io7GYVJBk=
X-Received: by 2002:a17:906:b0cb:b0:8b1:2d0e:281 with SMTP id bk11-20020a170906b0cb00b008b12d0e0281mr2788816ejb.18.1678805973750;
        Tue, 14 Mar 2023 07:59:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set/XTw24LCqFGNaFcrwMcuz5Qf9nJ1bmKJZIJY68sG3doUud9PbveOC4IeN89bxtmEsy9saBSQ==
X-Received: by 2002:a17:906:b0cb:b0:8b1:2d0e:281 with SMTP id bk11-20020a170906b0cb00b008b12d0e0281mr2788791ejb.18.1678805973363;
        Tue, 14 Mar 2023 07:59:33 -0700 (PDT)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id z4-20020a170906714400b008e53874f8d8sm1235863ejj.180.2023.03.14.07.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 07:59:33 -0700 (PDT)
Date: Tue, 14 Mar 2023 15:59:32 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <ZBCL1G+8z8c6zLI0@righiandr-XPS-13-7390>
References: <20230111161155.1349375-1-gary@garyguo.net>
 <ZA+IUIOAgrWH2oZ0@righiandr-XPS-13-7390>
 <20230313214853.GY19419@kitsune.suse.cz>
 <ZA+bXi0o27XPx3nz@righiandr-XPS-13-7390>
 <20230313220234.GZ19419@kitsune.suse.cz>
 <ZA+fGpAdnvB5VwKW@righiandr-XPS-13-7390>
 <ZBCG3ykG1q4GEcIf@righiandr-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBCG3ykG1q4GEcIf@righiandr-XPS-13-7390>
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
Cc: Gary Guo <gary@garyguo.net>, Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, Guo Zhengkui <guozhengkui@vivo.com>, Wedson Almeida Filho <wedsonaf@google.com>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Kees Cook <keescook@chromium.org>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 14, 2023 at 03:38:24PM +0100, Andrea Righi wrote:
> On Mon, Mar 13, 2023 at 11:09:31PM +0100, Andrea Righi wrote:
> > On Mon, Mar 13, 2023 at 11:02:34PM +0100, Michal Suchánek wrote:
> > > On Mon, Mar 13, 2023 at 10:53:34PM +0100, Andrea Righi wrote:
> > > > On Mon, Mar 13, 2023 at 10:48:53PM +0100, Michal Suchánek wrote:
> > > > > Hello,
> > > > > 
> > > > > On Mon, Mar 13, 2023 at 09:32:16PM +0100, Andrea Righi wrote:
> > > > > > On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:
> > > > > > > Currently modversion uses a fixed size array of size (64 - sizeof(long))
> > > > > > > to store symbol names, thus placing a hard limit on length of symbols.
> > > > > > > Rust symbols (which encodes crate and module names) can be quite a bit
> > > > > > > longer. The length limit in kallsyms is increased to 512 for this reason.
> > > > > > > 
> > > > > > > It's a waste of space to simply expand the fixed array size to 512 in
> > > > > > > modversion info entries. I therefore make it variably sized, with offset
> > > > > > > to the next entry indicated by the initial "next" field.
> > > > > > > 
> > > > > > > In addition to supporting longer-than-56/60 byte symbols, this patch also
> > > > > > > reduce the size for short symbols by getting rid of excessive 0 paddings.
> > > > > > > There are still some zero paddings to ensure "next" and "crc" fields are
> > > > > > > properly aligned.
> > > > > > > 
> > > > > > > This patch does have a tiny drawback that it makes ".mod.c" files generated
> > > > > > > a bit less easy to read, as code like
> > > > > > > 
> > > > > > > 	"\x08\x00\x00\x00\x78\x56\x34\x12"
> > > > > > > 	"symbol\0\0"
> > > > > > > 
> > > > > > > is generated as opposed to
> > > > > > > 
> > > > > > > 	{ 0x12345678, "symbol" },
> > > > > > > 
> > > > > > > because the structure is now variable-length. But hopefully nobody reads
> > > > > > > the generated file :)
> > > > > > > 
> > > > > > > Link: b8a94bfb3395 ("kallsyms: increase maximum kernel symbol length to 512")
> > > > > > > Link: https://github.com/Rust-for-Linux/linux/pull/379
> > > > > > > 
> > > > > > > Signed-off-by: Gary Guo <gary@garyguo.net>
> > > > > > 
> > > > > > Is there any newer version of this patch?
> > > > > > 
> > > > > > I'm doing some tests with it, but I'm getting boot failures on ppc64
> > > > > > with this applied (at boot kernel is spitting out lots of oops'es and
> > > > > > unfortunately it's really hard to copy paste or just read them from the
> > > > > > console).
> > > > > 
> > > > > Are you using the ELF ABI v1 or v2?
> > > > > 
> > > > > v1 may have some additional issues when it comes to these symbol tables.
> > > > > 
> > > > > Thanks
> > > > > 
> > > > > Michal
> > > > 
> > > > I have CONFIG_PPC64_ELF_ABI_V2=y in my .config, so I guess I'm using v2.
> > > > 
> > > > BTW, the issue seems to be in dedotify_versions(), as a silly test I
> > > > tried to comment out this function completely to be a no-op and now my
> > > > system boots fine (but I guess I'm probably breaking something else).
> > > 
> > > Probably not. You should not have the extra leading dot on ABI v2. So if
> > > dedotify does something that means something generates and then expects
> > > back symbols with a leading dot, and this workaround for ABI v1 breaks
> > > that. Or maybe it is called when it shouldn't.
> > 
> > Hm.. I'll add some debugging to this function to see what happens exactly.
> 
> Alright I've done more tests across different architectures. My problem
> with ppc64 is that this architecture is evaluating sechdrs[i].sh_size
> using get_stubs_size(), that apparently can add some extra padding, so
> doing (vers + vers->next < end) isn't a reliable check to determine the
> end of the variable array, because sometimes "end" can be greater than
> the last "vers + vers->next" entry.
> 
> In general I think it'd be more reliable to add a dummy NULL entry at
> the end of the modversion array.
> 
> Moreover, I think we also need to enforce struct modversion_info to be
> __packed, just to make sure that no extra padding is added (otherwise it
> may break our logic to determine the offset of the next entry).
> 
> > @@ -2062,16 +2066,25 @@ static void add_versions(struct buffer *b, struct module *mod)
> >  				s->name, mod->name);
> >  			continue;
> >  		}
> > -		if (strlen(s->name) >= MODULE_NAME_LEN) {
> > -			error("too long symbol \"%s\" [%s.ko]\n",
> > -			      s->name, mod->name);
> > -			break;
> > -		}
> > -		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
> > -			   s->crc, s->name);
> > +		name_len = strlen(s->name);
> > +		name_len_padded = (name_len + 1 + 3) & ~3;
> > +
> > +		/* Offset to next entry */
> > +		tmp = TO_NATIVE(8 + name_len_padded);
> 
> ^ Here's another issue that I found, you can't use TO_NATIVE() in this
> way, some compilers are complaining (like on s390x this doesn't build).
> 
> So we need to do something like:
> 
> 	/* Offset to next entry */
> 	tmp = 8 + name_len_padded
> 	tmp = TO_NATIVE(tmp);
> 
> I'll do some additional tests with these changes and send an updated
> patch (for those that are interested).
> 
> -Andrea

In practice, this is what I'm testing at the moment:

---
 arch/powerpc/kernel/module_64.c |  5 +++--
 include/linux/module.h          |  8 +++++---
 kernel/module/version.c         | 22 ++++++++++-----------
 scripts/export_report.pl        |  9 +++++----
 scripts/mod/modpost.c           | 35 +++++++++++++++++++++++----------
 5 files changed, 48 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index ff045644f13f..ea6c830ed1e7 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -234,12 +234,13 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 static void dedotify_versions(struct modversion_info *vers,
 			      unsigned long size)
 {
-	struct modversion_info *end;
+	struct modversion_info *end = (void *)vers + size;
 
-	for (end = (void *)vers + size; vers < end; vers++)
+	for (; vers < end && vers->next; vers = (void *)vers + vers->next) {
 		if (vers->name[0] == '.') {
 			memmove(vers->name, vers->name+1, strlen(vers->name));
 		}
+	}
 }
 
 /*
diff --git a/include/linux/module.h b/include/linux/module.h
index 8c5909c0076c..4744901bdf63 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -34,9 +34,11 @@
 #define MODULE_NAME_LEN MAX_PARAM_PREFIX_LEN
 
 struct modversion_info {
-	unsigned long crc;
-	char name[MODULE_NAME_LEN];
-};
+	/* Offset of the next modversion entry in relation to this one. */
+	u32 next;
+	u32 crc;
+	char name[0];
+} __packed;
 
 struct module;
 struct exception_table_entry;
diff --git a/kernel/module/version.c b/kernel/module/version.c
index 53f43ac5a73e..5528f98c42dc 100644
--- a/kernel/module/version.c
+++ b/kernel/module/version.c
@@ -17,32 +17,30 @@ int check_version(const struct load_info *info,
 {
 	Elf_Shdr *sechdrs = info->sechdrs;
 	unsigned int versindex = info->index.vers;
-	unsigned int i, num_versions;
-	struct modversion_info *versions;
+	struct modversion_info *versions, *end;
+	u32 crcval;
 
 	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
 	if (!crc)
 		return 1;
+	crcval = *crc;
 
 	/* No versions at all?  modprobe --force does this. */
 	if (versindex == 0)
 		return try_to_force_load(mod, symname) == 0;
 
 	versions = (void *)sechdrs[versindex].sh_addr;
-	num_versions = sechdrs[versindex].sh_size
-		/ sizeof(struct modversion_info);
+	end = (void *)versions + sechdrs[versindex].sh_size;
 
-	for (i = 0; i < num_versions; i++) {
-		u32 crcval;
-
-		if (strcmp(versions[i].name, symname) != 0)
+	for (; versions < end && versions->next;
+	       versions = (void *)versions + versions->next) {
+		if (strcmp(versions->name, symname) != 0)
 			continue;
 
-		crcval = *crc;
-		if (versions[i].crc == crcval)
+		if (versions->crc == crcval)
 			return 1;
-		pr_debug("Found checksum %X vs module %lX\n",
-			 crcval, versions[i].crc);
+		pr_debug("Found checksum %X vs module %X\n",
+			 crcval, versions->crc);
 		goto bad_version;
 	}
 
diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index feb3d5542a62..1117646f3141 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -116,18 +116,19 @@ foreach my $thismod (@allcfiles) {
 	while ( <$module> ) {
 		chomp;
 		if ($state == 0) {
-			$state = 1 if ($_ =~ /static const struct modversion_info/);
+			$state = 1 if ($_ =~ /static const char ____versions/);
 			next;
 		}
 		if ($state == 1) {
-			$state = 2 if ($_ =~ /__attribute__\(\(section\("__versions"\)\)\)/);
+			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
 			next;
 		}
 		if ($state == 2) {
-			if ( $_ !~ /0x[0-9a-f]+,/ ) {
+			if ( $_ !~ /\\0"/ ) {
+				last if ($_ =~ /;/);
 				next;
 			}
-			my $sym = (split /([,"])/,)[4];
+			my $sym = (split /(["\\])/,)[2];
 			my ($module, $value, $symbol, $gpl) = @{$SYMBOL{$sym}};
 			$SYMBOL{ $sym } =  [ $module, $value+1, $symbol, $gpl];
 			push(@{$MODULE{$thismod}} , $sym);
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index efff8078e395..55335ae98f4f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2046,13 +2046,17 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 static void add_versions(struct buffer *b, struct module *mod)
 {
 	struct symbol *s;
+	unsigned int name_len;
+	unsigned int name_len_padded;
+	unsigned int tmp;
+	unsigned char *tmp_view = (unsigned char *)&tmp;
 
 	if (!modversions)
 		return;
 
 	buf_printf(b, "\n");
-	buf_printf(b, "static const struct modversion_info ____versions[]\n");
-	buf_printf(b, "__used __section(\"__versions\") = {\n");
+	buf_printf(b, "static const char ____versions[]\n");
+	buf_printf(b, "__used __section(\"__versions\") =\n");
 
 	list_for_each_entry(s, &mod->unresolved_symbols, list) {
 		if (!s->module)
@@ -2062,16 +2066,27 @@ static void add_versions(struct buffer *b, struct module *mod)
 				s->name, mod->name);
 			continue;
 		}
-		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
-		}
-		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
-			   s->crc, s->name);
+		name_len = strlen(s->name);
+		name_len_padded = (name_len + 1 + 3) & ~3;
+
+		/* Offset to next entry */
+		tmp = 8 + name_len_padded;
+		tmp = TO_NATIVE(tmp);
+		buf_printf(b, "\t\"\\x%02x\\x%02x\\x%02x\\x%02x",
+			   tmp_view[0], tmp_view[1], tmp_view[2], tmp_view[3]);
+
+		tmp = TO_NATIVE(s->crc);
+		buf_printf(b, "\\x%02x\\x%02x\\x%02x\\x%02x\"\n",
+			   tmp_view[0], tmp_view[1], tmp_view[2], tmp_view[3]);
+
+		buf_printf(b, "\t\"%s", s->name);
+		for (; name_len < name_len_padded; name_len++)
+			buf_printf(b, "\\0");
+		buf_printf(b, "\"\n");
 	}
 
-	buf_printf(b, "};\n");
+	/* Always end with a dummy NULL entry */
+	buf_printf(b, "\t\"\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\";\n");
 }
 
 static void add_depends(struct buffer *b, struct module *mod)
-- 
2.39.2


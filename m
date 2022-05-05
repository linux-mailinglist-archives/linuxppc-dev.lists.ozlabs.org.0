Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1AF51CBB1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 23:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvSGg0JjDz3cFl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 07:57:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=AeMjd5vv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fjasle.eu (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=nicolas@fjasle.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256
 header.s=mail header.b=AeMjd5vv; dkim-atps=neutral
X-Greylist: delayed 2662 seconds by postgrey-1.36 at boromir;
 Fri, 06 May 2022 06:11:33 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvPwj145Vz3brL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 06:11:25 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.98.182]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mbj7g-1oNfyF0MsY-00dBs2; Thu, 05 May 2022 22:09:49 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 4200C3C088; Thu,  5 May 2022 22:09:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1651781387; bh=78ro9mZJoF+t7UFqUfx51nq549imwXNGprZ7dQU/WYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AeMjd5vv7SwW291xNlg6WB183s1Jtu2YpxLpSl8h+oMHbf2eD0NuEGGDNkSsxSOcP
 duTMdPOI0uX4qo/fRdwpZDh6iePT81vhodqvBLZ0nBnLAjSvAT65EF9Ves9rWLqdxN
 9OntH8UHafZgUVmBcTMyGrat+HDQcUWFHfZgEPKk=
Date: Thu, 5 May 2022 22:09:47 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3 07/15] modpost: extract symbol versions from *.cmd files
Message-ID: <YnQvC66wiDIGzeDo@fjasle.eu>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
 <20220505072244.1155033-8-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505072244.1155033-8-masahiroy@kernel.org>
X-Provags-ID: V03:K1:F1/VS82Iexieq6BXZvrYKwem7arUucGMnRl5JUmDSL2Cn4toyRh
 BiZDMe2fIFL75Rkkgs4S9qPdoLef3nun3zgHr1agdSb0dLgsFCy3HBccOLELRBbYZkpWmfO
 lkxp6NAkYP9zIVnu1AC5zA5HKxr6+Gx4rk3QWVl4GGT64S9vC6H+uxwV7xDXUWiZDcDrumk
 Cobvs7bmX0PvIXypVN5vg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8k2jbGGnYZE=:w4UWgqYcXXdjfLXk7fGV9Y
 UbT9TJ9Njv3XWYhfpGsbiqeTcpOApWH0njNVhoSFK8A1Vcnj3DX3/FVN2hk2im2AyRwdvSOSb
 tfdvmgC/S6OXv/DEMgQThgOHqPyLeaodIPfl/gPTnaLab7QpWMeVxRuD3CueU+TFwowSJ0sIX
 theIQpAqyfmTsahTvDGCRfAn8Ft6lSFzdSKvNyLbZiR/U9yPu2vzr8OYs3YijweODcT9fRjcF
 3tMW7Usc+EUMxiBarv4U2FpcfrMMz89hKmmFZ5QYAW+OrDcyf8oq425Hq29dvqxjMk6AOJ30n
 UaDgHlBKM/OVcXroIgH0xErhsFFNUfE30iBJ/EGtDLXvtQhgPGAhjIwXmfrtg4fa8ldf7CX0g
 dlItE3BHTRQFJbSJeT6Sz33whx5OH4kaPnkXUmy64AW3NiXynncKaibwKvWg0ifGkpfoE2zHq
 9L4WusTGAy/frl2cmtnDdWzi0JUVFEDe/XkrBLJDFP34eM5ile2kbA/lwr8tCw3au4uhKAarM
 d7j04mpm6IT9W1N8w3YMU2w+EiG1/JstVzR16tglhv5Sa6vUOT5rKF8I+qnuuMgQJUaS8uq2p
 LQlEWKlY4VMYN4ftOqpVVdestiCQxKeE8tLq0qD4eaDCS1JKZOP82/aQtKex2gDI/KFlIjWYM
 mrrBn4nlP+skECocJEVtdoIXvVqIi8lyhfW9kGi2FOR7bWpAXotkDnHOviRcpFjoOP5A=
X-Mailman-Approved-At: Fri, 06 May 2022 07:52:56 +1000
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
Cc: linux-s390@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 05, 2022 at 04:22:36PM +0900 Masahiro Yamada wrote:
> Currently, CONFIG_MODVERSIONS needs extra link to embed the symbol
> versions into ELF objects. Then, modpost extracts the version CRCs
> from them.
> 
> The following figures show how it currently works, and how I am trying
> to change it.
> 
> Current implementation
> ======================
>                                                            |----------|
>                  embed CRC      -------------------------->| final    |
>       $(CC)        $(LD)       /  |---------|              | link for |
>   *.c ------> *.o -------> *.o -->| modpost |              | vmlinux  |
>                      /            |         |-- *.mod.c -->| or       |
>      genksyms       /             |---------|              | module   |
>   *.c ------> *.symversions                                |----------|
> 
> Genksyms outputs the calculated CRCs in the form of linker script
> (*.symversions), which is used by $(LD) to update the object.
> 
> If CONFIG_LTO_CLANG=y, the build process becomes much more complex.
> Embedding the CRCs is postponed until the LLVM bitcode is converted
> into ELF, creating another intermediate *.prelink.o.
> 
> However, this complexity is unneeded. There is no reason why we must
> embed version CRCs in objects so early.
> 
> There is final link stage for vmlinux (scripts/link-vmlinux.sh) and
> modules (scripts/Makefile.modfinal). We can link CRCs at the very last
> moment.
> 
> New implementation
> ==================
>                                                            |----------|
>                    --------------------------------------->| final    |
>       $(CC)       /    |---------|                         | link for |
>   *.c ------> *.o ---->|         |                         | vmlinux  |
>                        | modpost |--- .vmlinux-symver.c -->| or       |
>      genksyms          |         |--- *.mod.c ------------>| module   |
>   *.c ------> *.cmd -->|---------|                         |----------|
> 
> Pass the symbol versions to modpost as separate text data, which are
> available in *.cmd files.
> 
> This commit changes modpost to extract CRCs from *.cmd files instead of
> from ELF objects.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>   - Simplify the implementation (parse .cmd files after ELF)
> 
>  scripts/mod/modpost.c | 177 ++++++++++++++++++++++++++++++------------
>  1 file changed, 129 insertions(+), 48 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 78a7107fcc40..92ee1f454e29 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -383,19 +383,10 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
>  	return s;
>  }
>  
> -static void sym_set_crc(const char *name, unsigned int crc)
> +static void sym_set_crc(struct symbol *sym, unsigned int crc)
>  {
> -	struct symbol *s = find_symbol(name);
> -
> -	/*
> -	 * Ignore stand-alone __crc_*, which might be auto-generated symbols
> -	 * such as __*_veneer in ARM ELF.
> -	 */
> -	if (!s)
> -		return;
> -
> -	s->crc = crc;
> -	s->crc_valid = true;
> +	sym->crc = crc;
> +	sym->crc_valid = true;
>  }
>  
>  static void *grab_file(const char *filename, size_t *size)
> @@ -618,33 +609,6 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
>  	return 0;
>  }
>  
> -static void handle_modversion(const struct module *mod,
> -			      const struct elf_info *info,
> -			      const Elf_Sym *sym, const char *symname)
> -{
> -	unsigned int crc;
> -
> -	if (sym->st_shndx == SHN_UNDEF) {
> -		warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
> -		     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
> -		     symname, mod->name, mod->is_vmlinux ? "" : ".ko",
> -		     symname);
> -
> -		return;
> -	}
> -
> -	if (sym->st_shndx == SHN_ABS) {
> -		crc = sym->st_value;
> -	} else {
> -		unsigned int *crcp;
> -
> -		/* symbol points to the CRC in the ELF object */
> -		crcp = sym_get_data(info, sym);
> -		crc = TO_NATIVE(*crcp);
> -	}
> -	sym_set_crc(symname, crc);
> -}
> -
>  static void handle_symbol(struct module *mod, struct elf_info *info,
>  			  const Elf_Sym *sym, const char *symname)
>  {
> @@ -1955,6 +1919,102 @@ static char *remove_dot(char *s)
>  	return s;
>  }
>  
> +/*
> + * The CRCs are recorded in .*.cmd files in the form of:
> + * #SYMVER <name> <crc>
> + */
> +static void extract_crcs_for_object(const char *object, struct module *mod)
> +{
> +	char cmd_file[PATH_MAX];
> +	char *buf, *p;
> +	const char *base;
> +	int dirlen, ret;
> +
> +	base = strrchr(object, '/');
> +	if (base) {
> +		base++;
> +		dirlen = base - object;
> +	} else {
> +		dirlen = 0;
> +		base = object;
> +	}
> +
> +	ret = snprintf(cmd_file, sizeof(cmd_file), "%.*s.%s.cmd",
> +		       dirlen, object, base);
> +	if (ret >= sizeof(cmd_file)) {
> +		error("%s: too long path was truncated\n", cmd_file);
> +		return;
> +	}
> +
> +	buf = read_text_file(cmd_file);
> +	p = buf;
> +
> +	while ((p = strstr(p, "\n#SYMVER "))) {
> +		char *name;
> +		size_t namelen;
> +		unsigned int crc;
> +		struct symbol *sym;
> +
> +		name = p + strlen("\n#SYMVER ");
> +
> +		p = strchr(name, ' ');
> +		if (!p)
> +			break;
> +
> +		namelen = p - name;
> +		p++;
> +
> +		if (!isdigit(*p))
> +			continue;	/* skip this line */
> +
> +		crc = strtol(p, &p, 0);
> +		if (*p != '\n')
> +			continue;	/* skip this line */
> +
> +		name[namelen] = '\0';
> +
> +		sym = sym_find_with_module(name, mod);
> +		if (!sym) {
> +			warn("Skip the version for unexported symbol \"%s\" [%s%s]\n",
> +			     name, mod->name, mod->is_vmlinux ? "" : ".ko");
> +			continue;
> +		}
> +		sym_set_crc(sym, crc);
> +	}
> +
> +	free(buf);
> +}
> +
> +/*
> + * The symbol versions (CRC) are recorded in the .*.cmd files.
> + * Parse them to retrieve CRCs for the current module.
> + */
> +static void mod_set_crcs(struct module *mod)
> +{
> +	char objlist[PATH_MAX];
> +	char *buf, *p, *obj;
> +	int ret;
> +
> +	if (mod->is_vmlinux) {
> +		strcpy(objlist, ".vmlinux.objs");
> +	} else {
> +		/* objects for a module are listed in the *.mod file. */
> +		ret = snprintf(objlist, sizeof(objlist), "%s.mod", mod->name);
> +		if (ret >= sizeof(objlist)) {
> +			error("%s: too long path was truncated\n", objlist);
> +			return;
> +		}
> +	}
> +
> +	buf = read_text_file(objlist);
> +	p = buf;
> +
> +	while ((obj = strsep(&p, "\n")) && obj[0])
> +		extract_crcs_for_object(obj, mod);
> +
> +	free(buf);
> +}
> +
>  static void read_symbols(const char *modname)
>  {
>  	const char *symname;
> @@ -2015,9 +2075,6 @@ static void read_symbols(const char *modname)
>  		if (strstarts(symname, "__kstrtabns_"))
>  			sym_update_namespace(symname + strlen("__kstrtabns_"),
>  					     sym_get_data(&info, sym));
> -		if (strstarts(symname, "__crc_"))
> -			handle_modversion(mod, &info, sym,
> -					  symname + strlen("__crc_"));
>  	}
>  
>  	// check for static EXPORT_SYMBOL_* functions && global vars
> @@ -2046,12 +2103,17 @@ static void read_symbols(const char *modname)
>  
>  	parse_elf_finish(&info);
>  
> -	/* Our trick to get versioning for module struct etc. - it's
> -	 * never passed as an argument to an exported function, so
> -	 * the automatic versioning doesn't pick it up, but it's really
> -	 * important anyhow */
> -	if (modversions)
> +	if (modversions) {
> +		/*
> +		 * Our trick to get versioning for module struct etc. - it's
> +		 * never passed as an argument to an exported function, so
> +		 * the automatic versioning doesn't pick it up, but it's really
> +		 * important anyhow
> +		 */
>  		sym_add_unresolved("module_layout", mod, false);
> +
> +		mod_set_crcs(mod);
> +	}
>  }
>  
>  static void read_symbols_from_files(const char *filename)
> @@ -2214,6 +2276,23 @@ static void add_header(struct buffer *b, struct module *mod)
>  		buf_printf(b, "\nMODULE_INFO(staging, \"Y\");\n");
>  }
>  
> +static void check_symversions(struct module *mod)
> +{
> +	struct symbol *sym;
> +
> +	if (!modversions)
> +		return;
> +
> +	list_for_each_entry(sym, &mod->exported_symbols, list) {
> +		if (!sym->crc_valid) {
> +			warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
> +			     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
> +			     sym->name, mod->name, mod->is_vmlinux ? "" : ".ko",
> +			     sym->name);
> +		}
> +	}
> +}
> +
>  /**
>   * Record CRCs for unresolved symbols
>   **/
> @@ -2429,7 +2508,7 @@ static void read_dump(const char *fname)
>  		}
>  		s = sym_add_exported(symname, mod, gpl_only);
>  		s->is_static = false;
> -		sym_set_crc(symname, crc);
> +		sym_set_crc(s, crc);
>  		sym_update_namespace(symname, namespace);
>  	}
>  	free(buf);
> @@ -2554,6 +2633,8 @@ int main(int argc, char **argv)
>  		if (mod->from_dump)
>  			continue;
>  
> +		check_symversions(mod);
> +
>  		if (!mod->is_vmlinux)
>  			write_mod_c_file(mod);
>  	}
> -- 
> 2.32.0

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
